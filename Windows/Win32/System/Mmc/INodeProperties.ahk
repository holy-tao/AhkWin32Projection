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
     * The GetProperty method retrieves text-only property values for a node. Your implementation of the INodeProperties::GetProperty method is called when an application based on the MMC 2.0 Automation Object Model retrieves the Node.Property property.
     * @param {IDataObject} pDataObject A pointer to the snap-in data object.
     * @param {BSTR} szPropertyName The name of the property retrieved.
     * @returns {BSTR} Text value for the property.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-inodeproperties-getproperty
     */
    GetProperty(pDataObject, szPropertyName) {
        szPropertyName := szPropertyName is String ? BSTR.Alloc(szPropertyName).Value : szPropertyName

        pbstrProperty := BSTR()
        result := ComCall(3, this, "ptr", pDataObject, "ptr", szPropertyName, "ptr", pbstrProperty, "HRESULT")
        return pbstrProperty
    }
}
