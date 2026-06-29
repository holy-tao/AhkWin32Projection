#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPPHRASE.ahk" { SPPHRASE }
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }
#Import ".\SPPHRASEPROPERTYHANDLE.ahk" { SPPHRASEPROPERTYHANDLE }
#Import ".\SPPHRASERULEHANDLE.ahk" { SPPHRASERULEHANDLE }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import ".\SPSERIALIZEDPHRASE.ahk" { SPSERIALIZEDPHRASE }
#Import ".\SPPHRASERULE.ahk" { SPPHRASERULE }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhraseBuilder extends ISpPhrase {
    /**
     * The interface identifier for ISpPhraseBuilder
     * @type {Guid}
     */
    static IID := Guid("{88a3342a-0bed-4834-922b-88d43173162f}")

    /**
     * The class identifier for SpPhraseBuilder
     * @type {Guid}
     */
    static CLSID := Guid("{777b6bbd-2ff2-11d3-88fe-00c04f8ef9b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhraseBuilder interfaces
    */
    struct Vtbl extends ISpPhrase.Vtbl {
        InitFromPhrase           : IntPtr
        InitFromSerializedPhrase : IntPtr
        AddElements              : IntPtr
        AddRules                 : IntPtr
        AddProperties            : IntPtr
        AddReplacements          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhraseBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPPHRASE>} pPhrase 
     * @returns {HRESULT} 
     */
    InitFromPhrase(pPhrase) {
        result := ComCall(7, this, SPPHRASE.Ptr, pPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPSERIALIZEDPHRASE>} pPhrase 
     * @returns {HRESULT} 
     */
    InitFromSerializedPhrase(pPhrase) {
        result := ComCall(8, this, SPSERIALIZEDPHRASE.Ptr, pPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<SPPHRASEELEMENT>} pElement 
     * @returns {HRESULT} 
     */
    AddElements(cElements, pElement) {
        result := ComCall(9, this, "uint", cElements, SPPHRASEELEMENT.Ptr, pElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPPHRASERULEHANDLE} hParent 
     * @param {Pointer<SPPHRASERULE>} pRule 
     * @returns {SPPHRASERULEHANDLE} 
     */
    AddRules(hParent, pRule) {
        phNewRule := SPPHRASERULEHANDLE()
        result := ComCall(10, this, SPPHRASERULEHANDLE, hParent, SPPHRASERULE.Ptr, pRule, SPPHRASERULEHANDLE.Ptr, phNewRule, "HRESULT")
        return phNewRule
    }

    /**
     * 
     * @param {SPPHRASEPROPERTYHANDLE} hParent 
     * @param {Pointer<SPPHRASEPROPERTY>} pProperty 
     * @returns {SPPHRASEPROPERTYHANDLE} 
     */
    AddProperties(hParent, pProperty) {
        phNewProperty := SPPHRASEPROPERTYHANDLE()
        result := ComCall(11, this, SPPHRASEPROPERTYHANDLE, hParent, SPPHRASEPROPERTY.Ptr, pProperty, SPPHRASEPROPERTYHANDLE.Ptr, phNewProperty, "HRESULT")
        return phNewProperty
    }

    /**
     * 
     * @param {Integer} cReplacements 
     * @param {Pointer<SPPHRASEREPLACEMENT>} pReplacements 
     * @returns {HRESULT} 
     */
    AddReplacements(cReplacements, pReplacements) {
        result := ComCall(12, this, "uint", cReplacements, SPPHRASEREPLACEMENT.Ptr, pReplacements, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPhraseBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitFromPhrase := CallbackCreate(GetMethod(implObj, "InitFromPhrase"), flags, 2)
        this.vtbl.InitFromSerializedPhrase := CallbackCreate(GetMethod(implObj, "InitFromSerializedPhrase"), flags, 2)
        this.vtbl.AddElements := CallbackCreate(GetMethod(implObj, "AddElements"), flags, 3)
        this.vtbl.AddRules := CallbackCreate(GetMethod(implObj, "AddRules"), flags, 4)
        this.vtbl.AddProperties := CallbackCreate(GetMethod(implObj, "AddProperties"), flags, 4)
        this.vtbl.AddReplacements := CallbackCreate(GetMethod(implObj, "AddReplacements"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitFromPhrase)
        CallbackFree(this.vtbl.InitFromSerializedPhrase)
        CallbackFree(this.vtbl.AddElements)
        CallbackFree(this.vtbl.AddRules)
        CallbackFree(this.vtbl.AddProperties)
        CallbackFree(this.vtbl.AddReplacements)
    }
}
