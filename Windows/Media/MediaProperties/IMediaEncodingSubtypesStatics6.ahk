#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingSubtypesStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingSubtypesStatics6
     * @type {Guid}
     */
    static IID => Guid("{a1252973-a984-5912-93bb-54e7e569e053}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pgs", "get_Srt", "get_Ssa", "get_VobSub"]

    /**
     * @type {HSTRING} 
     */
    Pgs {
        get => this.get_Pgs()
    }

    /**
     * @type {HSTRING} 
     */
    Srt {
        get => this.get_Srt()
    }

    /**
     * @type {HSTRING} 
     */
    Ssa {
        get => this.get_Ssa()
    }

    /**
     * @type {HSTRING} 
     */
    VobSub {
        get => this.get_VobSub()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pgs() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Srt() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssa() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VobSub() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
