.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD
INCLUDE Irvine32.inc

.data																																																; Tempat variabel
; Tampilan awal
; frame 1
logo_a_0 DB " /$$   /$$ /$$                  /$$$$$$                                   ",0                                  
logo_b_0 DB "| $$  | $$| $$                 /$$__  $$                                  ",0 
logo_c_0 DB "| $$  | $$| $$  /$$$$$$       | $$  \ $$  /$$$$$$$  /$$$$$$  /$$$$$$/$$$$ ",0
logo_d_0 DB "| $$  | $$| $$ /$$__  $$      | $$$$$$$$ /$$_____/ /$$__  $$| $$_  $$_  $$",0
logo_e_0 DB "| $$  | $$| $$| $$  \ $$      | $$__  $$|  $$$$$$ | $$$$$$$$| $$ \ $$ \ $$",0
logo_f_0 DB "| $$  | $$| $$| $$  | $$      | $$  | $$ \____  $$| $$_____/| $$ | $$ | $$",0
logo_g_0 DB "|  $$$$$$/| $$|  $$$$$$/      | $$  | $$ /$$$$$$$/|  $$$$$$$| $$ | $$ | $$",0
logo_h_0 DB "\______/ |__/ \______/        |__/  |__/|_______/  \_______/|__/ |__/ |__/",0

; frame 2                                                                          
logo_a_1 DB "$$\   $$\ $$\                  $$$$$$\                                    ",0
logo_b_1 DB "$$ |  $$ |$$ |                $$  __$$\                                   ",0
logo_c_1 DB "$$ |  $$ |$$ | $$$$$$\        $$ /  $$ | $$$$$$$\  $$$$$$\  $$$$$$\$$$$\  ",0
logo_d_1 DB "$$ |  $$ |$$ |$$  __$$\       $$$$$$$$ |$$  _____|$$  __$$\ $$  _$$  _$$\ ",0
logo_e_1 DB "$$ |  $$ |$$ |$$ /  $$ |      $$  __$$ |\$$$$$$\  $$$$$$$$ |$$ / $$ / $$ |",0
logo_f_1 DB "$$ |  $$ |$$ |$$ |  $$ |      $$ |  $$ | \____$$\ $$   ____|$$ | $$ | $$ |",0
logo_g_1 DB "\$$$$$$  |$$ |\$$$$$$  |      $$ |  $$ |$$$$$$$  |\$$$$$$$\ $$ | $$ | $$ |",0
logo_h_1 DB " \______/ \__| \______/       \__|  \__|\_______/  \_______|\__| \__| \__|",0

; frame 3
logo_a_2 DB " __    __  __                   ______                                    ",0
logo_b_2 DB "$$ |  $$ |$$ |  ______        /$$$$$$  |  _______   ______   _____  ____  ",0
logo_c_2 DB "$$ |  $$ |$$ | /      \       $$ |__$$ | /       | /      \ /     \/    \ ",0
logo_d_2 DB "$$ |  $$ |$$ |/$$$$$$  |      $$    $$ |/$$$$$$$/ /$$$$$$  |$$$$$$ $$$$  |",0
logo_e_2 DB "$$ |  $$ |$$ |$$ |  $$ |      $$$$$$$$ |$$      \ $$    $$ |$$ | $$ | $$ |",0
logo_f_2 DB "$$ \__$$ |$$ |$$ \__$$ |      $$ |  $$ | $$$$$$  |$$$$$$$$/ $$ | $$ | $$ |",0
logo_g_2 DB "$$    $$/ $$ |$$    $$/       $$ |  $$ |/     $$/ $$       |$$ | $$ | $$ |",0
logo_h_2 DB " $$$$$$/  $$/  $$$$$$/        $$/   $$/ $$$$$$$/   $$$$$$$/ $$/  $$/  $$/ ",0

; frame 4
logo_a_3 DB " __    __  __                   ______                                     ",0
logo_b_3 DB "| $$  | $$| $$  ______        |  $$$$$$\  _______   ______   ______ ____   ",0
logo_c_3 DB "| $$  | $$| $$ /      \       | $$__| $$ /       \ /      \ |      \    \  ",0
logo_d_3 DB "| $$  | $$| $$|  $$$$$$\      | $$    $$|  $$$$$$$|  $$$$$$\| $$$$$$\$$$$\ ",0
logo_e_3 DB "| $$  | $$| $$| $$  | $$      | $$$$$$$$ \$$    \ | $$    $$| $$ | $$ | $$ ",0
logo_f_3 DB "| $$__/ $$| $$| $$__/ $$      | $$  | $$ _\$$$$$$\| $$$$$$$$| $$ | $$ | $$ ",0
logo_g_3 DB " \$$    $$| $$ \$$    $$      | $$  | $$|       $$ \$$     \| $$ | $$ | $$ ",0
logo_h_3 DB "  \$$$$$$  \$$  \$$$$$$        \$$   \$$ \$$$$$$$   \$$$$$$$ \$$  \$$  \$$ ",0


copyright_a DB " V1.0 | Dibuat oleh Mohammad Farid Hendianto",0
copyright_b DB " 2022 |             2200018401              ",0

; Tampilan akhir



xDinding BYTE 52 DUP("X"),0																																											; Membuat dinding

strSkor BYTE "Skor kamu      : ",0																																									; Variabel untuk menampilkan skor
Skor BYTE 0																																															; Variabel untuk menyimpan skor
strSkorTertinggi BYTE "Skor Tertinggi : ",0
SkorTertinggi BYTE 0

strCobaLagi BYTE "Coba Lagi?  1=Ya, 0=Tidak",0												
SalahInput BYTE "Input Salah",0
strKamumati BYTE "Kamu mati ",0
strtampilanskor BYTE " point(s)",0
blank BYTE "                                     ",0

Ulo BYTE "X", 104 DUP("x")

xPosisi BYTE 45,44,43,42,41, 100 DUP(?)
yPosisi BYTE 15,15,15,15,15, 100 DUP(?)

xPosisiDinding BYTE 34,34,85,85																																										; posisi dinding dari  AtasKiri, BawahKiri, AtasKanan, BawahKanan 
yPosisiDinding BYTE 5,24,5,24

xApelPos BYTE ?
yApelPos BYTE ?

inputChar BYTE "+"																																													; + menunjukkan awal permainan
TerakhirInputKarakter BYTE ?				

strKecepatan BYTE "Kecepatan (1-Cepat, 2-Sedang, 3-Lambat): ",0								
Kecepatan	DWORD 0

.code


Utama PROC
TampilanAwal PROC
	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_0
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_1
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
	
	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_2
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_3
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
		mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_0
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_1
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
	
	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_2
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_3
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
	
		mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_0
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_0
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_0
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_1
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_1
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_1
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
	
	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_2
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_2
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_2
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay

	mov dl,25
	mov dh,6
	call Gotoxy
	mov edx, OFFSET logo_a_3
	mov eax, yellow
	call SetTextColor
	call WriteString

	mov dl,25
	mov dh,7
	call Gotoxy
	mov edx, OFFSET logo_b_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,8
	call Gotoxy
	mov edx, OFFSET logo_c_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,9
	call Gotoxy
	mov edx, OFFSET logo_e_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,10
	call Gotoxy
	mov edx, OFFSET logo_f_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,11
	call Gotoxy
	mov edx, OFFSET logo_g_3
	mov eax, red
	call SetTextColor
	call WriteString
	
	mov dl,25
	mov dh,12
	call Gotoxy
	mov edx, OFFSET logo_h_3
	mov eax, yellow
	call SetTextColor
	call WriteString
	
	mov dl,37
	mov dh,14
	call Gotoxy
	mov edx, OFFSET copyright_a
	mov eax, red (red*2)
	call SetTextColor
	call WriteString
	mov dl,37
	mov dh,15
	call Gotoxy
	mov edx, OFFSET copyright_b
	call WriteString
	mov eax,250
	call Delay
	
	mov eax, white
	call SetTextColor
	call clrscr
TampilanAwal ENDP

Permainan::
	call TampilanDinding																																											; Menggambar tembok 
	call TampilanPapanSkor																																											; Menggambar PapanSkor
	call MemilihKecepatanUlo																																										; Berikan Pemain untuk memilih kecepatan Ulo
	
	mov esi,0
	mov ecx,5
TampilanUlo:
	call TampilanPemain																																												; Menggambar  Ulo (Memulai dengan panjang 5 )
	inc esi
loop TampilanUlo

	call Randomize																																													; mengacak dengan library irvine32.
	call BuatAcakApel
	call TampilanApel																																												; Menampilkan selesai

	PermainanLoop::
		mov dl,106																																													; pindah kursor ke kordinat
		mov dh,1
		call Gotoxy

		; get user key input
		call ReadKey
        jz noKey																																													; akan loncat jika tidak ada keyboard yang dimasukkan oleh user
		processInput:
		mov bl, inputChar
		mov TerakhirInputKarakter, bl
		mov inputChar,al																																											; Menetapkan variabel

		noKey:
		cmp inputChar,"x"	
		je exitPermainan																																											; Keluar Permainan jika user input keyboard x

		cmp inputChar,"w"
		je CekAtas

		cmp inputChar,"s"
		je CekBawah

		cmp inputChar,"a"
		je CekKiri

		cmp inputChar,"d"
		je CekKanan
		jne PermainanLoop																																											; reloop if no meaningful key was entered


		; Cek keyboard (w,a,s,d) untuk bisa bergerak
		CekBawah:	
		cmp TerakhirInputKarakter, "w"
		je JanganGantiArah																																											; tidak bisa ke bawah langsung setelah ke atas
		mov cl, yPosisiDinding[1]
		dec cl																																														; one unit ubove the y-coordinate of the Bawah bound
		cmp yPosisi[0],cl
		jl PindahBawah
		je Mati																																														; mati jika tertabrak ke dinding

		CekKiri:		
		cmp TerakhirInputKarakter, "+"																																								; Cek whether its the start of the Permainan
		je JanganPergiKiri
		cmp TerakhirInputKarakter, "d"
		je JanganGantiArah
		mov cl, xPosisiDinding[0]
		inc cl
		cmp xPosisi[0],cl
		jg PindahKiri
		je Mati																																														; Cek untuk ke Kiri	

		CekKanan:		
		cmp TerakhirInputKarakter, "a"
		je JanganGantiArah
		mov cl, xPosisiDinding[2]
		dec cl
		cmp xPosisi[0],cl
		jl PindahKanan
		je Mati																																														; Cek untuk ke Kanan	

		CekAtas:		
		cmp TerakhirInputKarakter, "s"
		je JanganGantiArah
		mov cl, yPosisiDinding[0]
		inc cl
		cmp yPosisi,cl
		jg PindahAtas
		je Mati																																														; Cek for Atas	
		
		PindahAtas:		
		mov eax, Kecepatan																																											; mengurangi kecepatan gerak
		add eax, Kecepatan
		call delay
		mov esi, 0																																													; indeks 0(kepala Ulo)
		call PerbaruiPemain	
		mov ah, yPosisi[esi]	
		mov al, xPosisi[esi]																																										; al dan ah menyimpan posisi unit Ulo berikutnya
		dec yPosisi[esi]																																											; pindah ke kepala atas
		call TampilanPemain		
		call Tampilantubuh
		call CekUlo

		
		PindahBawah:																																												; pindah ke bawah
		mov eax, Kecepatan
		add eax, Kecepatan
		call delay
		mov esi, 0
		call PerbaruiPemain
		mov ah, yPosisi[esi]
		mov al, xPosisi[esi]
		inc yPosisi[esi]
		call TampilanPemain
		call Tampilantubuh
		call CekUlo


		PindahKiri:																																													; pindah ke Kiri
		mov eax, Kecepatan
		call delay
		mov esi, 0
		call PerbaruiPemain
		mov ah, yPosisi[esi]
		mov al, xPosisi[esi]
		dec xPosisi[esi]
		call TampilanPemain
		call Tampilantubuh
		call CekUlo


		PindahKanan:																																												; pindah ke Kanan
		mov eax, Kecepatan
		call delay
		mov esi, 0
		call PerbaruiPemain
		mov ah, yPosisi[esi]
		mov al, xPosisi[esi]
		inc xPosisi[esi]
		call TampilanPemain
		call Tampilantubuh
		call CekUlo

																																																	; Mengecek apakah sudah mendapatkan poin
		CekApel::
		mov esi,0
		mov bl,xPosisi[0]
		cmp bl,xApelPos
		jne Permainanloop																																											; mengulang lagi jika Ulo tidak bersinggungan dengan Apel
		mov bl,yPosisi[0]
		cmp bl,yApelPos
		jne Permainanloop																																											; reloop jika Ulo tidak bersinggungan dengan Apel
		call MemakanApel																																											; memanggil untuk memperbarui skor, menambahkan segmen Ulo dan memunculkan apel baru

jmp PermainanLoop																																													; perulangan lagi pada Permainanloop


	JanganGantiArah:																																												; Jangan allow user to change direction
	mov inputChar, bl																																												; set current inputChar as previous
	jmp noKey																																														; jump back to Melanjutkan moving the same direction 

	JanganPergiKiri:																																												; forbids the Ulo to Pergi Kiri at the begining of the Permainan
	mov	inputChar, "+"																																												; set current inputChar as "+"
	jmp PermainanLoop																																												; mengulang kembali pada perulanngan permainan

	Mati::
	call KamuMati
	 
	BermainLagi::			
	call InisialisasiUlangPermainan																																									; inisiasi ulang semuanya
	
	exitPermainan::
	
INVOKE ExitProcess,0
Utama ENDP


TampilanDinding PROC																																												; Prosedur untuk Tampilan Dinding
	mov dl,xPosisiDinding[0]
	mov dh,yPosisiDinding[0]
	call Gotoxy	
	mov edx,OFFSET xDinding
	call WriteString																																												; Tampilan dinding atas 

	mov dl,xPosisiDinding[1]
	mov dh,yPosisiDinding[1]
	call Gotoxy	
	mov edx,OFFSET xDinding		
	call WriteString																																												; Tampilan Dinding Bawah

	mov dl, xPosisiDinding[2]
	mov dh, yPosisiDinding[2]
	mov eax,"#"	
	inc yPosisiDinding[3]
	L11: 
	call Gotoxy	
	call WriteChar	
	inc dh
	cmp dh, yPosisiDinding[3]																																										; Tampilan Dinding kanan
	jl L11

	mov dl, xPosisiDinding[0]
	mov dh, yPosisiDinding[0]
	mov eax,"#"	
	L12: 
	call Gotoxy	
	call WriteChar	
	inc dh
	cmp dh, yPosisiDinding[3]																																										; Tampilan dinding kiri
	jl L12
	ret
TampilanDinding ENDP


TampilanPapanSkor PROC																																												; prosedur to Tampilan PapanSkor
	mov dl,1
	mov dh,1
	call Gotoxy
	mov edx,OFFSET strSkor																																											; mencetak kalimat indikator Skor
	call WriteString
	mov dl,19
	mov dh,1
	call Gotoxy
	mov eax,"0"
	call WriteChar																																													; PapanSkor dimulai dari nilai 0
	mov dl,1
	mov dh,2
	call Gotoxy
	mov edx,OFFSET strSkorTertinggi
	call WriteString
	mov dl,18
	mov dh,2
	call Gotoxy
	mov al,SkorTertinggi
	call WriteInt
	ret
TampilanPapanSkor ENDP


MemilihKecepatanUlo PROC																																											; Prosedur untuk pemain untuk memilih Kecepatan
	mov edx,0 
	mov dl,65				
	mov dh,1
	call Gotoxy	
	mov edx,OFFSET strKecepatan																																										; promt untuk memasukkan integer (1,2,3)
	call WriteString
	mov esi, 40																																														; perbedaan milisecond setiap level Kecepatan
	mov eax,0
	call readInt			
	cmp ax,1																																														; input 
	jl invalidKecepatan
	cmp ax, 3
	jg invalidKecepatan
	mul esi	
	mov Kecepatan, eax																																												; assign variabel Kecepatan pada milisekon
	ret

	invalidKecepatan:																																												; jump here if user entered an invalid number
	mov dl,105				
	mov dh,1
	call Gotoxy	
	mov edx, OFFSET SalahInput																																										; print pesan error
	call WriteString
	mov ax, 1500
	call delay
	mov dl,105				
	mov dh,1
	call Gotoxy	
	mov edx, OFFSET blank																																											; menghapus pesan error setelah delay 1.5 detik
	call writeString
	call TampilanPapanSkor
	call MemilihKecepatanUlo																																										; memanggil prosedur untuk user memilih lagi
	ret
MemilihKecepatanUlo ENDP

TampilanPemain PROC																																													; Tampilan Pemain at (xPosisi,yPosisi)
	mov dl,xPosisi[esi]
	mov dh,yPosisi[esi]
	call Gotoxy
	mov dl, al																																														; menyimpan sementara register al pada dl
	mov al, Ulo[esi]		
	call WriteChar
	mov al, dl			
	ret
TampilanPemain ENDP

PerbaruiPemain PROC																																													; menghapus Pemain at (xPosisi,yPosisi)
	mov dl,xPosisi[esi]
	mov dh,yPosisi[esi]
	call Gotoxy
	mov dl, al																																														; Menyimpan sementara register al pada dl
	mov al, " "
	call WriteChar
	mov al, dl
	ret
PerbaruiPemain ENDP

TampilanApel PROC																																													; Prosedur untuk menampilkan buah apel
	mov eax,red (red * 0)
	call SetTextColor																																												; Mengatur warna merah untuk Apel
	mov dl,xApelPos
	mov dh,yApelPos
	call Gotoxy
	mov al,"O"
	call WriteChar
	mov eax,white (black * 16)																																										; mengembalikan warna menjadi hitam dan putih
	call SetTextColor
	ret
TampilanApel ENDP

BuatAcakApel PROC																																													; Prosedur untuk mengacak Apel
	mov eax,49
	call RandomRange																																												; 0-49
	add eax, 35																																														; 35-84
	mov xApelPos,al
	mov eax,17
	call RandomRange																																												; 0-17
	add eax, 6																																														; 6-23
	mov yApelPos,al

	mov ecx, 5
	add cl, Skor																																													; banyak angka perulangan of segmen Ulo 
	mov esi, 0
CekApelxPosisi:
	movzx eax,  xApelPos
	cmp al, xPosisi[esi]		
	je CekApelyPosisi																																												; loncat jika xposisi Ulo pada esi = xPosisi pada Apel
	Melanjutkanloop:
	inc esi
loop CekApelxPosisi
	ret																																																; kembali saat Apel tidak belum dimakan oleh Ulo
	CekApelyPosisi:
	movzx eax, yApelPos			
	cmp al, yPosisi[esi]
	jne Melanjutkanloop																																												; jump back to Melanjutkan loop if yPosisi of Ulo at esi != yPosisi of Apel
	call BuatAcakApel																																												; Apel generated on Ulo, calling function again to Buat another set of coordinates
BuatAcakApel ENDP

CekUlo PROC																																															; Cek whether the Ulo head collides w its tubuh 
	mov al, xPosisi[0] 
	mov ah, yPosisi[0] 
	mov esi,4																																														; Mulai mengecek dari indeks 4 (segmen ke-5)
	mov ecx,1
	add cl,Skor
cekxposisi:
	cmp xPosisi[esi], al																																											; Cek jika xPosisi same ornot
	je xPosisiSame
	contloop:
	inc esi
loop cekxposisi
	jmp CekApel
	xPosisiSame:																																													; Jika xPosisi dan yPosisi sama
	cmp yPosisi[esi], ah
	je Mati																																															; Jika bertabrakan, Ulo nya mati
	jmp contloop

CekUlo ENDP

Tampilantubuh PROC																																													; Prosedur untuk mencetak tubuh Ulo
		mov ecx, 4
		add cl, Skor																																												; banyak angka perulangan untuk mencetak tubuh Ulo dan ekornya	
		CetakTubuhPerulangan:
		
		inc esi																																														; perulangan untuk mencetak tubuh tersisa dari Ulo
		call PerbaruiPemain
		mov dl, xPosisi[esi]
		mov dh, yPosisi[esi]																																										; dl dan dh adalah tempat smentara untuk menyimpanthe current pos of the unit 
		mov yPosisi[esi], ah
		mov xPosisi[esi], al																																										; Menetapkan posisi baru ke unit
		mov al, dl
		mov ah,dh																																													; Pindah the  posisi back into al dan ah
		call TampilanPemain
		cmp esi, ecx
		jl CetakTubuhPerulangan
	ret
Tampilantubuh ENDP

MemakanApel PROC
	; Ulo sedang memakan apel

	inc Skor
	mov ebx,4
	add bl, Skor
	mov esi, ebx
	mov ah, yPosisi[esi-1]
	mov al, xPosisi[esi-1]	
	mov xPosisi[esi], al																																											; menambah 1 segmen pada Ulo
	mov yPosisi[esi], ah																																											; posisi dari ekor baru = posisi ekor lama

	cmp xPosisi[esi-2], al																																											; Cek if the old tail and the unit before is on the yAxis
	jne Ceky																																														; jump if not on the yAxis

	cmp yPosisi[esi-2], ah																																											; Cek if the new tail should be above or below of the old tail 
	jl incy			
	jg decy
	incy:																																															; increment jika ke bawah
	inc yPosisi[esi]
	jmp Melanjutkan
	decy:																																															; decrement jika ke atas
	dec yPosisi[esi]
	jmp Melanjutkan

	Ceky:																																															; Ekor lama dan segmen ulo sebelum itu berada pada x Axis
	cmp yPosisi[esi-2], ah																																											; Cek apakah ekor yang baru harus kanan atau kiri dari ekor yang lama
	jl incx
	jg decx
	incx:																																															; increment jika ke Kanan
	inc xPosisi[esi]			
	jmp Melanjutkan
	decx:																																															; decrement jika ke Kiri
	dec xPosisi[esi]

	Melanjutkan:																																													; tambahkan ekor Ulo dan memperbarui dengan memunculkan apel baru
	call TampilanPemain		
	call BuatAcakApel
	call TampilanApel			

	mov dl,18																																														; Menulis Skor
	mov dh,1
	call Gotoxy
	mov al,Skor
	call WriteInt
	ret
MemakanApel ENDP


KamuMati PROC
	mov eax, 1000
	call delay
	Call ClrScr	
	
	mov dl,	57
	mov dh, 12
	call Gotoxy
	mov edx, OFFSET strKamumati																																										; "Kamu Mati"
	call WriteString

	mov dl,	56
	mov dh, 14
	call Gotoxy
	movzx eax, Skor
	call WriteInt
	mov edx, OFFSET strtampilanskor																																										; Menampilkan Skor
	call WriteString
	
	mov dl,	50
	mov dh, 18
	call Gotoxy
	mov edx, OFFSET strCobaLagi
	call WriteString																																												; "Coba Lagi?"

	mov al,Skor
	cmp al,SkorTertinggi
	jle Mencobalagi
	mov SkorTertinggi, al
	
	MencobaLagi:
	mov dh, 19
	mov dl,	56
	call Gotoxy
	call ReadInt																																													; mendapatkan input user
	cmp al, 1
	je BermainLagi																																													; Bermain Lagi
	cmp al, 0
	je exitPermainan																																												; keluar dari Permainan

	mov dh,	17
	call Gotoxy
	mov edx, OFFSET SalahInput																																										; "Salah Input"
	call WriteString		
	mov dl,	56
	mov dh, 19
	call Gotoxy
	mov edx, OFFSET blank																																											; membersihkan input sebelumnya
	call WriteString
	jmp MencobaLagi																																													; biarkan user untuk input lagi
KamuMati ENDP

InisialisasiUlangPermainan PROC																																										; Prosedur untuk inisiasi ulang permainan
	mov xPosisi[0], 45
	mov xPosisi[1], 44
	mov xPosisi[2], 43
	mov xPosisi[3], 42
	mov xPosisi[4], 41
	mov yPosisi[0], 15
	mov yPosisi[1], 15
	mov yPosisi[2], 15
	mov yPosisi[3], 15
	mov yPosisi[4], 15																																												; Inisiasi ulang posisi Ulo
	mov Skor,0																																														; Inisiasi ulang skor
	mov TerakhirInputKarakter, 0
	mov	inputChar, "+"																																												; Inisiasi ulang inputChar and TerakhirInputKarakter
	dec yPosisiDinding[3]																																											; Mengembalikan posisi dinding
	Call ClrScr
	jmp Permainan																																														; mengulang Permainan kembali
InisialisasiUlangPermainan ENDP
END Utama