#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The INodeProperties interface retrieves text-only properties for a node.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-inodeproperties
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class INodeProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INodeProperties
     * @type {Guid}
     */
    static IID => Guid("{15bc4d24-a522-4406-aa55-0749537a6865}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty"]

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {BSTR} szPropertyName 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-inodeproperties-getproperty
     */
    GetProperty(pDataObject, szPropertyName, pbstrProperty) {
        szPropertyName := szPropertyName is String ? BSTR.Alloc(szPropertyName).Value : szPropertyName

        result := ComCall(3, this, "ptr", pDataObject, "ptr", szPropertyName, "ptr", pbstrProperty, "HRESULT")
        return result
    }
}
