#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IUpdate5.ahk

/**
 * Represents info about the aspects of search results returned in the ISearchResult object that were incomplete.
 * @remarks
 * The <b>IUpdateException</b> object is returned as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-isearchresult-get_warnings">ISearchResult::Warnings</a> property when a search succeeds but can't return complete results. For example, Windows Update might not have been able to retrieve all of the update metadata for a given update from the server. In this situation, the search results returned in the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> object are usable, but they aren't necessarily complete. The properties of the <b>IUpdateException</b> objects that are returned by the <b>ISearchResult::Warnings</b> property contain info about the  aspects of the search that were incomplete. This info is unlikely to be useful programmatically, but can sometimes be useful for debugging.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iupdateexception
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateEx extends IUpdate5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateEx
     * @type {Guid}
     */
    static IID => Guid("{769355a3-c5a0-497c-a606-560a36d2121c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedStaticProperty", "EvaluateExtendedDynamicProperty"]

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     */
    get_ExtendedStaticProperty(propertyName) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        retval := VARIANT()
        result := ComCall(60, this, "ptr", propertyName, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     */
    EvaluateExtendedDynamicProperty(propertyName) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        retval := VARIANT()
        result := ComCall(61, this, "ptr", propertyName, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }
}
