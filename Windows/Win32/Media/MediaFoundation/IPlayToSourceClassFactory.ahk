#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPlayToControl.ahk" { IPlayToControl }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an instance of the PlayToSource object.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The CLSID is <b>CLSID_PlayToSourceClassFactory</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-iplaytosourceclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IPlayToSourceClassFactory extends IUnknown {
    /**
     * The interface identifier for IPlayToSourceClassFactory
     * @type {Guid}
     */
    static IID := Guid("{842b32a3-9b9b-4d1c-b3f3-49193248a554}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPlayToSourceClassFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPlayToSourceClassFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the PlayToController object.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ne-mfsharingengine-playto_source_createflags">PLAYTO_SOURCE_CREATEFLAGS</a> enumeration.
     * @param {IPlayToControl} pControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/nn-mfsharingengine-iplaytocontrol">IPlayToControl</a> interface.
     * @returns {IInspectable} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytosourceclassfactory-createinstance
     */
    CreateInstance(dwFlags, pControl) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pControl, "ptr*", &ppSource := 0, "HRESULT")
        return IInspectable(ppSource)
    }

    Query(iid) {
        if (IPlayToSourceClassFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
