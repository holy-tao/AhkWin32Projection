#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPXMLRESULTOPTIONS.ahk" { SPXMLRESULTOPTIONS }
#Import ".\SPSEMANTICERRORINFO.ahk" { SPSEMANTICERRORINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhrase2 extends ISpPhrase {
    /**
     * The interface identifier for ISpPhrase2
     * @type {Guid}
     */
    static IID := Guid("{f264da52-e457-4696-b856-a737b717af79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhrase2 interfaces
    */
    struct Vtbl extends ISpPhrase.Vtbl {
        GetXMLResult    : IntPtr
        GetXMLErrorInfo : IntPtr
        GetAudio        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhrase2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SPXMLRESULTOPTIONS} Options 
     * @returns {PWSTR} 
     */
    GetXMLResult(Options) {
        result := ComCall(7, this, PWSTR.Ptr, &ppszCoMemXMLResult := 0, SPXMLRESULTOPTIONS, Options, "HRESULT")
        return ppszCoMemXMLResult
    }

    /**
     * 
     * @param {Pointer<SPSEMANTICERRORINFO>} pSemanticErrorInfo 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(pSemanticErrorInfo) {
        result := ComCall(8, this, SPSEMANTICERRORINFO.Ptr, pSemanticErrorInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @returns {ISpStreamFormat} 
     */
    GetAudio(ulStartElement, cElements) {
        result := ComCall(9, this, "uint", ulStartElement, "uint", cElements, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    Query(iid) {
        if (ISpPhrase2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXMLResult := CallbackCreate(GetMethod(implObj, "GetXMLResult"), flags, 3)
        this.vtbl.GetXMLErrorInfo := CallbackCreate(GetMethod(implObj, "GetXMLErrorInfo"), flags, 2)
        this.vtbl.GetAudio := CallbackCreate(GetMethod(implObj, "GetAudio"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXMLResult)
        CallbackFree(this.vtbl.GetXMLErrorInfo)
        CallbackFree(this.vtbl.GetAudio)
    }
}
