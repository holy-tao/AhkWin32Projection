#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent hardware features that can be queried for the current device by using the [FilterUnsupportedSystemFeaturesAsync](storeconfiguration_filterunsupportedsystemfeaturesasync_1497477694.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storesystemfeature
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StoreSystemFeature extends Win32Enum{

    /**
     * The device chipset uses the x86 CPU architecture.
     * @type {Integer (Int32)}
     */
    static ArchitectureX86 => 0

    /**
     * The device chipset uses the x64 CPU architecture.
     * @type {Integer (Int32)}
     */
    static ArchitectureX64 => 1

    /**
     * The device chipset uses the ARM CPU architecture.
     * @type {Integer (Int32)}
     */
    static ArchitectureArm => 2

    /**
     * The device supports DirectX9.
     * @type {Integer (Int32)}
     */
    static DirectX9 => 3

    /**
     * The device supports DirectX10.
     * @type {Integer (Int32)}
     */
    static DirectX10 => 4

    /**
     * The device supports DirectX11.
     * @type {Integer (Int32)}
     */
    static DirectX11 => 5

    /**
     * The device supports Direct3D 12 feature level 12.0.
     * @type {Integer (Int32)}
     */
    static D3D12HardwareFL11 => 6

    /**
     * The device supports Direct3D 12 feature level 12.1.
     * @type {Integer (Int32)}
     */
    static D3D12HardwareFL12 => 7

    /**
     * The device has 300 MB of RAM.
     * @type {Integer (Int32)}
     */
    static Memory300MB => 8

    /**
     * The device has 750 MB of RAM.
     * @type {Integer (Int32)}
     */
    static Memory750MB => 9

    /**
     * The device has 1 GB of RAM.
     * @type {Integer (Int32)}
     */
    static Memory1GB => 10

    /**
     * The device has 2 GB of RAM.
     * @type {Integer (Int32)}
     */
    static Memory2GB => 11

    /**
     * The device has a front-facing camera.
     * @type {Integer (Int32)}
     */
    static CameraFront => 12

    /**
     * The device has a rear-facing camera.
     * @type {Integer (Int32)}
     */
    static CameraRear => 13

    /**
     * The device has a gyroscope.
     * @type {Integer (Int32)}
     */
    static Gyroscope => 14

    /**
     * The device supports hover touch.
     * @type {Integer (Int32)}
     */
    static Hover => 15

    /**
     * The device has a magnetometer.
     * @type {Integer (Int32)}
     */
    static Magnetometer => 16

    /**
     * The device includes an NFC device.
     * @type {Integer (Int32)}
     */
    static Nfc => 17

    /**
     * The display resolution is 720p.
     * @type {Integer (Int32)}
     */
    static Resolution720P => 18

    /**
     * The display resolution is WVGA.
     * @type {Integer (Int32)}
     */
    static ResolutionWvga => 19

    /**
     * The display resolution is 720p or WVGA.
     * @type {Integer (Int32)}
     */
    static ResolutionWvgaOr720P => 20

    /**
     * The display resolution is WXGA
     * @type {Integer (Int32)}
     */
    static ResolutionWxga => 21

    /**
     * The display resolution is WVGA or WXGA.
     * @type {Integer (Int32)}
     */
    static ResolutionWvgaOrWxga => 22

    /**
     * The display resolution is WXGA or 720p.
     * @type {Integer (Int32)}
     */
    static ResolutionWxgaOr720P => 23

    /**
     * The device has 4 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory4GB => 24

    /**
     * The device has 6 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory6GB => 25

    /**
     * The device has 8 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory8GB => 26

    /**
     * The device has 12 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory12GB => 27

    /**
     * The device has 16 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory16GB => 28

    /**
     * The device has 20 GB of memory.
     * @type {Integer (Int32)}
     */
    static Memory20GB => 29

    /**
     * The device has 2 GB of video memory.
     * @type {Integer (Int32)}
     */
    static VideoMemory2GB => 30

    /**
     * The device has4 GB of video memory.
     * @type {Integer (Int32)}
     */
    static VideoMemory4GB => 31

    /**
     * The device has 6 GB of video memory.
     * @type {Integer (Int32)}
     */
    static VideoMemory6GB => 32

    /**
     * The device has 1 GB of video memory.
     * @type {Integer (Int32)}
     */
    static VideoMemory1GB => 33

    /**
     * The device chipset uses the ARM64 CPU architecture.
     * @type {Integer (Int32)}
     */
    static ArchitectureArm64 => 34
}
