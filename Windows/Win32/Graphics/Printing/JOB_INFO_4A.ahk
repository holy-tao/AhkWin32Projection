#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class JOB_INFO_4A extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PSTR(this.ptr + 8)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PSTR}
     */
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PSTR(this.ptr + 16)
            return this.__pMachineName
        }
    }

    /**
     * @type {PSTR}
     */
    pUserName{
        get {
            if(!this.HasProp("__pUserName"))
                this.__pUserName := PSTR(this.ptr + 24)
            return this.__pUserName
        }
    }

    /**
     * @type {PSTR}
     */
    pDocument{
        get {
            if(!this.HasProp("__pDocument"))
                this.__pDocument := PSTR(this.ptr + 32)
            return this.__pDocument
        }
    }

    /**
     * @type {PSTR}
     */
    pNotifyName{
        get {
            if(!this.HasProp("__pNotifyName"))
                this.__pNotifyName := PSTR(this.ptr + 40)
            return this.__pNotifyName
        }
    }

    /**
     * @type {PSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PSTR(this.ptr + 48)
            return this.__pDatatype
        }
    }

    /**
     * @type {PSTR}
     */
    pPrintProcessor{
        get {
            if(!this.HasProp("__pPrintProcessor"))
                this.__pPrintProcessor := PSTR(this.ptr + 56)
            return this.__pPrintProcessor
        }
    }

    /**
     * @type {PSTR}
     */
    pParameters{
        get {
            if(!this.HasProp("__pParameters"))
                this.__pParameters := PSTR(this.ptr + 64)
            return this.__pParameters
        }
    }

    /**
     * @type {PSTR}
     */
    pDriverName{
        get {
            if(!this.HasProp("__pDriverName"))
                this.__pDriverName := PSTR(this.ptr + 72)
            return this.__pDriverName
        }
    }

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pDevMode {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {PSTR}
     */
    pStatus{
        get {
            if(!this.HasProp("__pStatus"))
                this.__pStatus := PSTR(this.ptr + 88)
            return this.__pStatus
        }
    }

    /**
     * @type {PSECURITY_DESCRIPTOR}
     */
    pSecurityDescriptor{
        get {
            if(!this.HasProp("__pSecurityDescriptor"))
                this.__pSecurityDescriptor := PSECURITY_DESCRIPTOR(this.ptr + 96)
            return this.__pSecurityDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    UntilTime {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(this.ptr + 136)
            return this.__Submitted
        }
    }

    /**
     * @type {Integer}
     */
    Time {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    PagesPrinted {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    SizeHigh {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }
}
