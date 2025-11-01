#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Filter Plugin Store
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbfilterpluginstore
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbFilterPluginStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbFilterPluginStore
     * @type {Guid}
     */
    static IID => Guid("{85b44b0f-ed78-413f-9702-fa6d3b5ee755}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveProperties", "EnumerateProperties", "DeleteProperties"]

    /**
     * 
     * @param {ITsSbPropertySet} pPropertySet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-saveproperties
     */
    SaveProperties(pPropertySet) {
        result := ComCall(3, this, "ptr", pPropertySet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-enumerateproperties
     */
    EnumerateProperties(ppPropertySet) {
        result := ComCall(4, this, "ptr*", ppPropertySet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbfilterpluginstore-deleteproperties
     */
    DeleteProperties(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(5, this, "ptr", propertyName, "HRESULT")
        return result
    }
}
