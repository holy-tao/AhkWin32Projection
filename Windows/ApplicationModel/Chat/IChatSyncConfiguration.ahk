#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatSyncConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatSyncConfiguration
     * @type {Guid}
     */
    static IID => Guid("{09f869b2-69f4-4aff-82b6-06992ff402d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSyncEnabled", "put_IsSyncEnabled", "get_RestoreHistorySpan", "put_RestoreHistorySpan"]

    /**
     * @type {Boolean} 
     */
    IsSyncEnabled {
        get => this.get_IsSyncEnabled()
        set => this.put_IsSyncEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    RestoreHistorySpan {
        get => this.get_RestoreHistorySpan()
        set => this.put_RestoreHistorySpan(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyncEnabled() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSyncEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RestoreHistorySpan() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RestoreHistorySpan(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
