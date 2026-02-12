#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSuggestionsQueryOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSuggestionsQueryOptions
     * @type {Guid}
     */
    static IID => Guid("{efb8b74d-0d84-579c-b137-ea730635d9bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SuggestionsKind", "get_RemoteFileId", "get_MaxResults", "get_QueryId", "get_PropertiesToFetch"]

    /**
     * @type {Integer} 
     */
    SuggestionsKind {
        get => this.get_SuggestionsKind()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteFileId {
        get => this.get_RemoteFileId()
    }

    /**
     * @type {Integer} 
     */
    MaxResults {
        get => this.get_MaxResults()
    }

    /**
     * @type {HSTRING} 
     */
    QueryId {
        get => this.get_QueryId()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    PropertiesToFetch {
        get => this.get_PropertiesToFetch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestionsKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteFileId() {
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
    get_MaxResults() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PropertiesToFetch() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
