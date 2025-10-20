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
     * 
     * @param {Pointer<ITsSbPropertySet>} pPropertySet 
     * @returns {HRESULT} 
     */
    SaveProperties(pPropertySet) {
        result := ComCall(3, this, "ptr", pPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    EnumerateProperties(ppPropertySet) {
        result := ComCall(4, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     */
    DeleteProperties(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(5, this, "ptr", propertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
