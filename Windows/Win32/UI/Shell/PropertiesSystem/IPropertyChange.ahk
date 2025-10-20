#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectWithPropertyKey.ahk

/**
 * Exposes a method that encapsulates a change to a single property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertychange
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyChange extends IObjectWithPropertyKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyChange
     * @type {Guid}
     */
    static IID => Guid("{f917bc8a-1bba-4478-a245-1bde03eb9431}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplyToPropVariant"]

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvarIn 
     * @param {Pointer<PROPVARIANT>} ppropvarOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychange-applytopropvariant
     */
    ApplyToPropVariant(propvarIn, ppropvarOut) {
        result := ComCall(5, this, "ptr", propvarIn, "ptr", ppropvarOut, "HRESULT")
        return result
    }
}
