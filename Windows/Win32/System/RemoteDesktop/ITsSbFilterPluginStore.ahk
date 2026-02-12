#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbPropertySet.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Filter Plugin Store
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbfilterpluginstore
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
     * Saves a property set.
     * @param {ITsSbPropertySet} pPropertySet 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbfilterpluginstore-saveproperties
     */
    SaveProperties(pPropertySet) {
        result := ComCall(3, this, "ptr", pPropertySet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates a property set.
     * @returns {ITsSbPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbfilterpluginstore-enumerateproperties
     */
    EnumerateProperties() {
        result := ComCall(4, this, "ptr*", &ppPropertySet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbPropertySet(ppPropertySet)
    }

    /**
     * Deletes a property.
     * @param {BSTR} propertyName 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbfilterpluginstore-deleteproperties
     */
    DeleteProperties(propertyName) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        result := ComCall(5, this, "ptr", propertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
