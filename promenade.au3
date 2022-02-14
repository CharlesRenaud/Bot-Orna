#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <MsgBoxConstants.au3>

Func Fight()
		$mobIsAlive = true
		$manche = 1
		While $mobIsAlive = true
			$leaveFight = PixelSearch(2772, 895, 2957, 926, 0xFEF7EF, 5)
			If @error Then
				$manche = $manche + 1
				if Mod($manche, 2) Then
					MouseClick("left" , 2210, 845, 1)
					sleep(3500)
				ElseIf $manche = 6 Then
					MouseClick("left" , 3069, 739, 1)
					sleep(2500)
				ElseIf $manche = 12 Then
					MouseClick("left" , 3069, 739, 1)
					sleep(2500)
				ElseIf $manche = 18 Then
					MouseClick("left" , 3069, 739, 1)
					sleep(2500)
				Else
					MouseClick("left" , 3515, 735, 1)
					sleep(3500)
				EndIf
			Else
				MouseClick("left" , 2866, 922, 1)
				$mobIsAlive = false
			EndIf
		Wend
EndFunc

Func OpenGPS()
	MouseClick("left", 2180, 18, 1)
	MouseClick("left", 2849, 410, 1)
	MouseClick("left", 2840, 67, 1)
	Sleep(1000)
	MouseClick("left", 2175, 17, 1)
	MouseClick("left", 2854, 534, 1)
	sleep(5000)
EndFunc

Func GetTeritory()

	$chestCheck = PixelSearch(3137, 970, 3029, 1021, 0xE9FE00, 5)
	If Not @error Then 
		MouseClick("left", 3180, 960, 1)
		MouseClick("left", 2865, 234, 1)
		Opt("MouseClickDownDelay", 2000)
		MouseClick("left", 2858 , 790, 1)
		Opt("MouseClickDownDelay", 10)
		Sleep(1000)
		Fight()
	EndIf

	MouseClick("left", 3180, 950, 1)
	MouseClick("left", 3299, 236, 1)
	sleep(1000)
	$result = PixelSearch(2674, 706, 3067, 763, 0x507051, 1)
	If @error Then 
		MouseClick("left", 2862, 966, 1)
		Else
			Opt("MouseClickDownDelay", 2000)
			MouseClick("left" ,2868 , 740, 1)
			Opt("MouseClickDownDelay", 10)
			MouseClick("left", 2862, 966, 1)
	EndIf
EndFunc


Func CheckBoss()
		$verre = PixelSearch(2111, 215, 3722, 850, 0xFC9838, 0)
		If Not @error Then
			$verreCheck = PixelSearch($verre[0], $verre[1], $verre[0]+10, $verre[1]+10, 0x0000000, 2)
				If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $verreCheck[0], $verreCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
				Fight()
				EndIf
		EndIf

		$demon = PixelSearch(2093, 165, 3722, 850, 0xFF0000, 5)
		If Not @error Then
			$demonCheck = PixelSearch($demon[0], $demon[1], $demon[0], $demon[1]+15, 0xFF0000, 5)
				If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $demonCheck[0], $demonCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
				Fight()
				EndIf
		EndIf

		$spider = PixelSearch(2093, 165, 3722, 850, 0x6CA85D, 0)
		If Not @error Then
			$spiderCheck = PixelSearch($spider[0], $spider[1], $spider[0], $spider[1]+50, 0x507D45, 10)
				If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $spiderCheck[0], $spiderCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
				Fight()
				EndIf
		EndIf

		$purpleMolusque = PixelSearch(2093, 165, 3722, 850, 0x976ACA, 0)
		If Not @error Then
			$molusqueCheck = PixelSearch($purpleMolusque[0], $purpleMolusque[1], $purpleMolusque[0], $purpleMolusque[1]+50, 0xF3F3F3, 5)
				If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $molusqueCheck[0], $molusqueCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
				Fight()
				EndIf
		EndIf
EndFunc

Func CheckItem()
	$luckybox = PixelSearch(2111, 215, 3722, 850, 0xCBC220, 0)
		If Not @error Then
			$luckyCheck = PixelSearch($luckybox[0], $luckybox[1], $luckybox[0]+30, $luckybox[1], 0x9725A4, 0)
			If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $luckyCheck[0], $luckyCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
			Endif
		EndIF

	$xpStatut = PixelSearch(2111, 215, 3722, 850, 0x919191, 6)
		If Not @error Then
			$xpCheck = PixelSearch($xpStatut[0], $xpStatut[1], $xpStatut[0]+44, $xpStatut[1], 0x696969, 6)
			If Not @error Then
				Opt("MouseClickDownDelay", 2000)
				MouseClick("left", $xpCheck[0], $xpCheck[1], 1)
				Opt("MouseClickDownDelay", 10)
				Sleep(1000)
			Endif
		EndIF
EndFunc


Local $looping = 1

While $looping < 20000 
	$looping = $looping + 1
	CheckItem()
	CheckBoss()
	GetTeritory()
	sleep(1500)
	OpenGPS()
WEnd