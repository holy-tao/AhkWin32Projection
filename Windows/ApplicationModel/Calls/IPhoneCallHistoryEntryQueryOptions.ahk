#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallHistoryEntryQueryOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallHistoryEntryQueryOptions
     * @type {Guid}
     */
    static IID => Guid("{9c5fe15c-8bed-40ca-b06e-c4ca8eae5c87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredMedia", "put_DesiredMedia", "get_SourceIds"]

    /**
     * @type {Integer} 
     */
    DesiredMedia {
        get => this.get_DesiredMedia()
        set => this.put_DesiredMedia(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    SourceIds {
        get => this.get_SourceIds()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredMedia() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredMedia(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SourceIds() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
