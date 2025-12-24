#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable you to set or retrieve a DataPackage object's IDataObject interface, which the DataPackage uses to support interoperability. The DataPackage object is used by an app to provide data to another app.
 * @remarks
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Do not implement this interface. An implementation is provided as part of the DataPackage object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idataobjectprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDataObjectProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataObjectProvider
     * @type {Guid}
     */
    static IID => Guid("{3d25f6d6-4b2a-433c-9184-7c33ad35d001}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDataObject", "SetDataObject"]

    /**
     * Gets an IDataObject representation of the current DataPackage object.
     * @returns {IDataObject} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that, when this method returns successfully, points to the <b>IDataObject</b> representation of the <a href="https://docs.microsoft.com/uwp/api/Windows.ApplicationModel.DataTransfer.DataPackage">DataPackage</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idataobjectprovider-getdataobject
     */
    GetDataObject() {
        result := ComCall(3, this, "ptr*", &dataObject := 0, "HRESULT")
        return IDataObject(dataObject)
    }

    /**
     * Wraps an IDataObject instance as a Windows Runtime DataPackage.
     * @param {IDataObject} dataObject An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer to the data object from which to build the DataPackage object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idataobjectprovider-setdataobject
     */
    SetDataObject(dataObject) {
        result := ComCall(4, this, "ptr", dataObject, "HRESULT")
        return result
    }
}
