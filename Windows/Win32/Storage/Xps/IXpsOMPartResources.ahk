#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMColorProfileResourceCollection.ahk" { IXpsOMColorProfileResourceCollection }
#Import ".\IXpsOMRemoteDictionaryResourceCollection.ahk" { IXpsOMRemoteDictionaryResourceCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMImageResourceCollection.ahk" { IXpsOMImageResourceCollection }
#Import ".\IXpsOMFontResourceCollection.ahk" { IXpsOMFontResourceCollection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to all shared, part-based resources of the XPS document.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMPartResources    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreatePartResources (&newInterface);
 * 
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompartresources
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMPartResources extends IUnknown {
    /**
     * The interface identifier for IXpsOMPartResources
     * @type {Guid}
     */
    static IID := Guid("{f4cf7729-4864-4275-99b3-a8717163ecaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMPartResources interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFontResources             : IntPtr
        GetImageResources            : IntPtr
        GetColorProfileResources     : IntPtr
        GetRemoteDictionaryResources : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMPartResources.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IXpsOMFontResourceCollection interface that contains the fonts that are used in the XPS document.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMFontResourceCollection} A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresourcecollection">IXpsOMFontResourceCollection</a> interface that contains the fonts that are used in the XPS document.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getfontresources
     */
    GetFontResources() {
        result := ComCall(3, this, "ptr*", &fontResources := 0, "HRESULT")
        return IXpsOMFontResourceCollection(fontResources)
    }

    /**
     * Gets the IXpsOMImageResourceCollection interface that contains the images that are used in the XPS document.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMImageResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresourcecollection">IXpsOMImageResourceCollection</a> interface that contains the images that are used in the XPS document.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getimageresources
     */
    GetImageResources() {
        result := ComCall(4, this, "ptr*", &imageResources := 0, "HRESULT")
        return IXpsOMImageResourceCollection(imageResources)
    }

    /**
     * Gets the IXpsOMColorProfileResourceCollection interface that contains the color profiles that are used in the XPS document.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMColorProfileResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresourcecollection">IXpsOMColorProfileResourceCollection</a> interface that contains  the color profiles that are used in the XPS document.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getcolorprofileresources
     */
    GetColorProfileResources() {
        result := ComCall(5, this, "ptr*", &colorProfileResources := 0, "HRESULT")
        return IXpsOMColorProfileResourceCollection(colorProfileResources)
    }

    /**
     * Gets the IXpsOMRemoteDictionaryResourceCollection interface that contains the remote resource dictionaries that are used in the XPS document.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMRemoteDictionaryResourceCollection} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresourcecollection">IXpsOMRemoteDictionaryResourceCollection</a> interface that  contains the remote resource dictionaries that are used in the XPS document.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompartresources-getremotedictionaryresources
     */
    GetRemoteDictionaryResources() {
        result := ComCall(6, this, "ptr*", &dictionaryResources := 0, "HRESULT")
        return IXpsOMRemoteDictionaryResourceCollection(dictionaryResources)
    }

    Query(iid) {
        if (IXpsOMPartResources.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontResources := CallbackCreate(GetMethod(implObj, "GetFontResources"), flags, 2)
        this.vtbl.GetImageResources := CallbackCreate(GetMethod(implObj, "GetImageResources"), flags, 2)
        this.vtbl.GetColorProfileResources := CallbackCreate(GetMethod(implObj, "GetColorProfileResources"), flags, 2)
        this.vtbl.GetRemoteDictionaryResources := CallbackCreate(GetMethod(implObj, "GetRemoteDictionaryResources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontResources)
        CallbackFree(this.vtbl.GetImageResources)
        CallbackFree(this.vtbl.GetColorProfileResources)
        CallbackFree(this.vtbl.GetRemoteDictionaryResources)
    }
}
