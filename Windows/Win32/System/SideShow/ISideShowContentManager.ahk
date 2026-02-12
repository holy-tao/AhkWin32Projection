#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISideShowCapabilitiesCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowContentManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowContentManager
     * @type {Guid}
     */
    static IID => Guid("{a5d5b66b-eef9-41db-8d7e-e17c33ab10b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "RemoveAll", "SetEventSink", "GetDeviceCapabilities"]

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {ISideShowContent} in_pIContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(in_pIContent) {
        result := ComCall(3, this, "ptr", in_pIContent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {Integer} in_contentId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(in_contentId) {
        result := ComCall(4, this, "uint", in_contentId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISideShowEvents} in_pIEvents 
     * @returns {HRESULT} 
     */
    SetEventSink(in_pIEvents) {
        result := ComCall(6, this, "ptr", in_pIEvents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISideShowCapabilitiesCollection} 
     */
    GetDeviceCapabilities() {
        result := ComCall(7, this, "ptr*", &out_ppCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISideShowCapabilitiesCollection(out_ppCollection)
    }
}
