#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the Minor Class code of the device. These are interpreted in the context of the Major Class codes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothminorclass
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothMinorClass extends Win32Enum{

    /**
     * Use when a Minor Class code has not been assigned.
     * @type {Integer (Int32)}
     */
    static Uncategorized => 0

    /**
     * A computer desktop.
     * @type {Integer (Int32)}
     */
    static ComputerDesktop => 1

    /**
     * A computer server.
     * @type {Integer (Int32)}
     */
    static ComputerServer => 2

    /**
     * A laptop computer.
     * @type {Integer (Int32)}
     */
    static ComputerLaptop => 3

    /**
     * A handheld PC/PDA.
     * @type {Integer (Int32)}
     */
    static ComputerHandheld => 4

    /**
     * A palm-sized PC/PDA.
     * @type {Integer (Int32)}
     */
    static ComputerPalmSize => 5

    /**
     * A wearable, watch-sized, computer.
     * @type {Integer (Int32)}
     */
    static ComputerWearable => 6

    /**
     * A tablet computer.
     * @type {Integer (Int32)}
     */
    static ComputerTablet => 7

    /**
     * A cell phone.
     * @type {Integer (Int32)}
     */
    static PhoneCellular => 1

    /**
     * A cordless phone.
     * @type {Integer (Int32)}
     */
    static PhoneCordless => 2

    /**
     * A smartphone.
     * @type {Integer (Int32)}
     */
    static PhoneSmartPhone => 3

    /**
     * A wired modem or voice gateway.
     * @type {Integer (Int32)}
     */
    static PhoneWired => 4

    /**
     * Common ISDN access.
     * @type {Integer (Int32)}
     */
    static PhoneIsdn => 5

    /**
     * Fully available.
     * @type {Integer (Int32)}
     */
    static NetworkFullyAvailable => 0

    /**
     * 1% to 17% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed01To17Percent => 8

    /**
     * 17% to 33% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed17To33Percent => 16

    /**
     * 33% to 50% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed33To50Percent => 24

    /**
     * 50% to 67% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed50To67Percent => 32

    /**
     * 67% to 83% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed67To83Percent => 40

    /**
     * 83% to 99% utilized.
     * @type {Integer (Int32)}
     */
    static NetworkUsed83To99Percent => 48

    /**
     * Network service is not available.
     * @type {Integer (Int32)}
     */
    static NetworkNoServiceAvailable => 56

    /**
     * A wearable headset device.
     * @type {Integer (Int32)}
     */
    static AudioVideoWearableHeadset => 1

    /**
     * A hands-free device.
     * @type {Integer (Int32)}
     */
    static AudioVideoHandsFree => 2

    /**
     * A microphone.
     * @type {Integer (Int32)}
     */
    static AudioVideoMicrophone => 4

    /**
     * A loudspeaker.
     * @type {Integer (Int32)}
     */
    static AudioVideoLoudspeaker => 5

    /**
     * Headphones.
     * @type {Integer (Int32)}
     */
    static AudioVideoHeadphones => 6

    /**
     * Portable audio device.
     * @type {Integer (Int32)}
     */
    static AudioVideoPortableAudio => 7

    /**
     * A car audio device.
     * @type {Integer (Int32)}
     */
    static AudioVideoCarAudio => 8

    /**
     * A set-top box.
     * @type {Integer (Int32)}
     */
    static AudioVideoSetTopBox => 9

    /**
     * A HiFi audio device.
     * @type {Integer (Int32)}
     */
    static AudioVideoHifiAudioDevice => 10

    /**
     * A VCR.
     * @type {Integer (Int32)}
     */
    static AudioVideoVcr => 11

    /**
     * A video camera.
     * @type {Integer (Int32)}
     */
    static AudioVideoVideoCamera => 12

    /**
     * A camcorder.
     * @type {Integer (Int32)}
     */
    static AudioVideoCamcorder => 13

    /**
     * A video monitor.
     * @type {Integer (Int32)}
     */
    static AudioVideoVideoMonitor => 14

    /**
     * A video display and loudspeaker.
     * @type {Integer (Int32)}
     */
    static AudioVideoVideoDisplayAndLoudspeaker => 15

    /**
     * A video conferencing device.
     * @type {Integer (Int32)}
     */
    static AudioVideoVideoConferencing => 16

    /**
     * A gaming console or toy.
     * @type {Integer (Int32)}
     */
    static AudioVideoGamingOrToy => 18

    /**
     * A joystick.
     * @type {Integer (Int32)}
     */
    static PeripheralJoystick => 1

    /**
     * A gamepad.
     * @type {Integer (Int32)}
     */
    static PeripheralGamepad => 2

    /**
     * A remote control.
     * @type {Integer (Int32)}
     */
    static PeripheralRemoteControl => 3

    /**
     * A sensing device.
     * @type {Integer (Int32)}
     */
    static PeripheralSensing => 4

    /**
     * A digitizer tablet.
     * @type {Integer (Int32)}
     */
    static PeripheralDigitizerTablet => 5

    /**
     * A card reader.
     * @type {Integer (Int32)}
     */
    static PeripheralCardReader => 6

    /**
     * A digital pen.
     * @type {Integer (Int32)}
     */
    static PeripheralDigitalPen => 7

    /**
     * A handheld scanner for bar codes, RFID, etc
     * @type {Integer (Int32)}
     */
    static PeripheralHandheldScanner => 8

    /**
     * A handheld gesture input device, such as a "wand" form factor device.
     * @type {Integer (Int32)}
     */
    static PeripheralHandheldGesture => 9

    /**
     * A wristwatch.
     * @type {Integer (Int32)}
     */
    static WearableWristwatch => 1

    /**
     * A pager.
     * @type {Integer (Int32)}
     */
    static WearablePager => 2

    /**
     * A jacket.
     * @type {Integer (Int32)}
     */
    static WearableJacket => 3

    /**
     * A helmet.
     * @type {Integer (Int32)}
     */
    static WearableHelmet => 4

    /**
     * Glasses.
     * @type {Integer (Int32)}
     */
    static WearableGlasses => 5

    /**
     * A robot.
     * @type {Integer (Int32)}
     */
    static ToyRobot => 1

    /**
     * A vehicle.
     * @type {Integer (Int32)}
     */
    static ToyVehicle => 2

    /**
     * A doll or action figure.
     * @type {Integer (Int32)}
     */
    static ToyDoll => 3

    /**
     * A controller.
     * @type {Integer (Int32)}
     */
    static ToyController => 4

    /**
     * A game.
     * @type {Integer (Int32)}
     */
    static ToyGame => 5

    /**
     * A blood pressure monitor.
     * @type {Integer (Int32)}
     */
    static HealthBloodPressureMonitor => 1

    /**
     * A thermometer.
     * @type {Integer (Int32)}
     */
    static HealthThermometer => 2

    /**
     * A weighing scale.
     * @type {Integer (Int32)}
     */
    static HealthWeighingScale => 3

    /**
     * A glucose meter.
     * @type {Integer (Int32)}
     */
    static HealthGlucoseMeter => 4

    /**
     * A pulse oximeter.
     * @type {Integer (Int32)}
     */
    static HealthPulseOximeter => 5

    /**
     * A heart rate or pulse monitor.
     * @type {Integer (Int32)}
     */
    static HealthHeartRateMonitor => 6

    /**
     * A health data display.
     * @type {Integer (Int32)}
     */
    static HealthHealthDataDisplay => 7

    /**
     * A step counter.
     * @type {Integer (Int32)}
     */
    static HealthStepCounter => 8

    /**
     * A body composition analyzer.
     * @type {Integer (Int32)}
     */
    static HealthBodyCompositionAnalyzer => 9

    /**
     * A peak flow monitor.
     * @type {Integer (Int32)}
     */
    static HealthPeakFlowMonitor => 10

    /**
     * A medication monitor.
     * @type {Integer (Int32)}
     */
    static HealthMedicationMonitor => 11

    /**
     * A knee prosthesis.
     * @type {Integer (Int32)}
     */
    static HealthKneeProsthesis => 12

    /**
     * An ankle prosthesis.
     * @type {Integer (Int32)}
     */
    static HealthAnkleProsthesis => 13

    /**
     * A generic health manager.
     * @type {Integer (Int32)}
     */
    static HealthGenericHealthManager => 14

    /**
     * A personal mobility device.
     * @type {Integer (Int32)}
     */
    static HealthPersonalMobilityDevice => 15
}
