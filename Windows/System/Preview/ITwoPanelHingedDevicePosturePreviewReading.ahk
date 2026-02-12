#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class ITwoPanelHingedDevicePosturePreviewReading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPanelHingedDevicePosturePreviewReading
     * @type {Guid}
     */
    static IID => Guid("{a0251452-4ad6-4b38-8426-c59a15493a7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_HingeState", "get_Panel1Orientation", "get_Panel1Id", "get_Panel2Orientation", "get_Panel2Id"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Integer} 
     */
    HingeState {
        get => this.get_HingeState()
    }

    /**
     * @type {Integer} 
     */
    Panel1Orientation {
        get => this.get_Panel1Orientation()
    }

    /**
     * @type {HSTRING} 
     */
    Panel1Id {
        get => this.get_Panel1Id()
    }

    /**
     * @type {Integer} 
     */
    Panel2Orientation {
        get => this.get_Panel2Orientation()
    }

    /**
     * @type {HSTRING} 
     */
    Panel2Id {
        get => this.get_Panel2Id()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HingeState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel1Orientation() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Panel1Id() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel2Orientation() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Panel2Id() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
