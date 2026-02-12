#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreImage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreImage
     * @type {Guid}
     */
    static IID => Guid("{081fd248-adb4-4b64-a993-784789926ed5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri", "get_ImagePurposeTag", "get_Width", "get_Height", "get_Caption"]

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {HSTRING} 
     */
    ImagePurposeTag {
        get => this.get_ImagePurposeTag()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ImagePurposeTag() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
