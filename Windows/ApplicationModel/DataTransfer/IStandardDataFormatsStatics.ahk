#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IStandardDataFormatsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardDataFormatsStatics
     * @type {Guid}
     */
    static IID => Guid("{7ed681a1-a880-40c9-b4ed-0bee1e15f549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Text", "get_Uri", "get_Html", "get_Rtf", "get_Bitmap", "get_StorageItems"]

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {HSTRING} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {HSTRING} 
     */
    Html {
        get => this.get_Html()
    }

    /**
     * @type {HSTRING} 
     */
    Rtf {
        get => this.get_Rtf()
    }

    /**
     * @type {HSTRING} 
     */
    Bitmap {
        get => this.get_Bitmap()
    }

    /**
     * @type {HSTRING} 
     */
    StorageItems {
        get => this.get_StorageItems()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
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
    get_Uri() {
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
    get_Html() {
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
    get_Rtf() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bitmap() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StorageItems() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
