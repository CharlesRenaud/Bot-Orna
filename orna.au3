#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Vilpex

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


#include <MsgBoxConstants.au3>



$healthColor = 0x9B0A0A
$manaColor = 0x0074FE
$mobHealthColor = 0xCBCBCB
Local $emptyStats = ["00282928", "00282829", "00282828", "00292929",  "00292828", "00282929", "00292928"]
$fightAvailableColor = 0x506F50
$monsterLevelColor = 0xD4BC12
$fightNotAvailable = 0xA2A2A2

$test = 0xFFF8F0

Func UsePotion()
	Opt("MouseClickDownDelay", 2000)
	MouseClick("left", 3005, 960, 1)
	Opt("MouseClickDownDelay", 10)
EndFunc

Func LaunchFight()
		Opt("MouseClickDownDelay", 2000)
		MouseClick("left" , $result[0] - 20 , $result[1] + 25, 1)
		Opt("MouseClickDownDelay", 10)
		sleep(500)
		$fightIsLaunched = PixelGetColor(2862, 901)
		If Hex($fightIsLaunched) = "000B0700" Then
			Fight()
			ElseIf Hex($fightIsLaunched) = "00000000" Then
			Fight()
			Else
				MouseClick("left" , 2864, 967, 1)
				sleep(1000)
				MouseClickDrag("left", 2412, 107, 2800, 107, 1)
		EndIf
EndFunc

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

	$loop = 1
	While $loop < 20000
	sleep(1800)
	
		$fightIsLaunched = PixelGetColor(2862, 901)
		If Hex($fightIsLaunched) = "000B0700" Then
			Fight()
			ElseIf Hex($fightIsLaunched) = "00000000" Then
			Fight()
		EndIf

		$checkMenuOpen = PixelGetColor(2865, 966)
		If Hex($checkMenuOpen) = "00F4F4F3" Then
			MouseClick("left" , 2865, 966, 1)
			sleep(1500)
		EndIf

		$loop = $loop + 1
		If Mod($loop, 2) Then
		MouseClickDrag("left", 2412, 107, 2800, 107, 1)
		EndIf

		$searchLvlUp = PixelSearch(2777, 897, 2955, 925, 0xFEF7EF, 10)
		If Not @error Then
			MouseClick("left" , 2868, 909, 1)
		EndIf


		$healthPourcent = PixelGetColor(2886 , 998)
		Switch Hex($healthPourcent)
			Case $emptyStats[0]
				usePotion()
			Case $emptyStats[1]
				usePotion()
			Case $emptyStats[2]
				usePotion()
			Case $emptyStats[3]
				usePotion()
			Case $emptyStats[4]
				usePotion()
			Case $emptyStats[5]
				usePotion()
			Case $emptyStats[6]
				usePotion()
		EndSwitch

		$manaPourcent = PixelGetColor(2891 , 1022)
		Switch Hex($manaPourcent)
			Case $emptyStats[0]
				usePotion()
			Case $emptyStats[1]
				usePotion()
			Case $emptyStats[2]
				usePotion()
			Case $emptyStats[3]
				usePotion()
			Case $emptyStats[4]
				usePotion()
			Case $emptyStats[5]
				usePotion()
			Case $emptyStats[6]
				usePotion()
		EndSwitch
				
		

		$result = PixelSearch(2350, 200, 3500, 860, $monsterLevelColor, 10)
		If Not @error Then
			LaunchFight()
		EndIf
	Wend



