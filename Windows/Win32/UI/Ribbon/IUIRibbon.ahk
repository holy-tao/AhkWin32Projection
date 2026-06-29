#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUIRibbon interface is implemented by the Windows Ribbon framework and provides the ability to specify settings and properties for a ribbon.
 * @remarks
 * A Ribbon is composed of several components that can include an <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-applicationmenu">Application Menu</a>, the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-quickaccesstoolbar">Quick Access Toolbar (QAT)</a>, 
 * 				<a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-tab">Tabs</a> (core and contextual), <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-group">Groups</a> (containers for controls), and a rich context menu  system (<a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a>).
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuiribbon
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIRibbon extends IUnknown {
    /**
     * The interface identifier for IUIRibbon
     * @type {Guid}
     */
    static IID := Guid("{803982ab-370a-4f7e-a9e7-8784036a6e26}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIRibbon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHeight              : IntPtr
        LoadSettingsFromStream : IntPtr
        SaveSettingsToStream   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIRibbon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the height of the ribbon.
     * @remarks
     * The value returned for <i>cy</i> is based on a number of dependencies that
     * 			include, but are not limited to, the width of the host window and the layout template declared 
     * 			in the Ribbon markup.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The height of the ribbon, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-getheight
     */
    GetHeight() {
        result := ComCall(3, this, "uint*", &_cy := 0, "HRESULT")
        return _cy
    }

    /**
     * Reads ribbon settings from a binary stream.
     * @remarks
     * The stream is supplied by the host application.
     * 			
     * If the Windows Ribbon framework is unable to load a valid stream, the default ribbon layout is rendered instead.
     * 			
     * 
     * The <b>LoadSettingsFromStream </b> method is useful for persisting ribbon state, such as Quick Access Toolbar (QAT) items, across application instances.
     * @param {IStream} pStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or E_FAIL if the format or content of the serialized stream is empty or cannot be verified by the Ribbon framework.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-loadsettingsfromstream
     */
    LoadSettingsFromStream(pStream) {
        result := ComCall(4, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * Writes ribbon settings to a binary stream.
     * @remarks
     * The stream is handed off to the host application for storage as appropriate.
     * 			
     * 
     * The <b>SaveSettingsToStream</b> method is useful for persisting ribbon state, such as Quick Access Toolbar (QAT) items, across application instances.
     * @param {IStream} pStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-savesettingstostream
     */
    SaveSettingsToStream(pStream) {
        result := ComCall(5, this, "ptr", pStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIRibbon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHeight := CallbackCreate(GetMethod(implObj, "GetHeight"), flags, 2)
        this.vtbl.LoadSettingsFromStream := CallbackCreate(GetMethod(implObj, "LoadSettingsFromStream"), flags, 2)
        this.vtbl.SaveSettingsToStream := CallbackCreate(GetMethod(implObj, "SaveSettingsToStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHeight)
        CallbackFree(this.vtbl.LoadSettingsFromStream)
        CallbackFree(this.vtbl.SaveSettingsToStream)
    }
}
