#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is intended for infrastructure use only.
 * @see https://docs.microsoft.com/windows/win32/api//featurestagingapi/ns-featurestagingapi-feature_error
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class FEATURE_ERROR extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Infrastructure use only.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    lineNumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    file {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    process {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    module {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    callerReturnAddressOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    callerModule {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    message {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    originLineNumber {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    originFile {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    originModule {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    originCallerReturnAddressOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    originCallerModule {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Infrastructure use only.
     * @type {Pointer<Byte>}
     */
    originName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
