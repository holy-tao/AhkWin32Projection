#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugDocumentHost.ahk" { IDebugDocumentHost }
#Import ".\IActiveScript.ahk" { IActiveScript }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugApplication32.ahk" { IDebugApplication32 }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentHelper32 extends IUnknown {
    /**
     * The interface identifier for IDebugDocumentHelper32
     * @type {Guid}
     */
    static IID := Guid("{51973c26-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentHelper32 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init                       : IntPtr
        Attach                     : IntPtr
        Detach                     : IntPtr
        AddUnicodeText             : IntPtr
        AddDBCSText                : IntPtr
        SetDebugDocumentHost       : IntPtr
        AddDeferredText            : IntPtr
        DefineScriptBlock          : IntPtr
        SetDefaultTextAttr         : IntPtr
        SetTextAttributes          : IntPtr
        SetLongName                : IntPtr
        SetShortName               : IntPtr
        SetDocumentAttr            : IntPtr
        GetDebugApplicationNode    : IntPtr
        GetScriptBlockInfo         : IntPtr
        CreateDebugDocumentContext : IntPtr
        BringDocumentToTop         : IntPtr
        BringDocumentContextToTop  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentHelper32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugApplication32} pda 
     * @param {PWSTR} pszShortName 
     * @param {PWSTR} pszLongName 
     * @param {Integer} docAttr 
     * @returns {HRESULT} 
     */
    Init(pda, pszShortName, pszLongName, docAttr) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(3, this, "ptr", pda, "ptr", pszShortName, "ptr", pszLongName, "uint", docAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentHelper32} pddhParent 
     * @returns {HRESULT} 
     */
    Attach(pddhParent) {
        result := ComCall(4, this, "ptr", pddhParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    AddUnicodeText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(6, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszText 
     * @returns {HRESULT} 
     */
    AddDBCSText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentHost} pddh 
     * @returns {HRESULT} 
     */
    SetDebugDocumentHost(pddh) {
        result := ComCall(8, this, "ptr", pddh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cChars 
     * @param {Integer} dwTextStartCookie 
     * @returns {HRESULT} 
     */
    AddDeferredText(cChars, dwTextStartCookie) {
        result := ComCall(9, this, "uint", cChars, "uint", dwTextStartCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {IActiveScript} pas 
     * @param {BOOL} fScriptlet 
     * @returns {Integer} 
     */
    DefineScriptBlock(ulCharOffset, cChars, pas, fScriptlet) {
        result := ComCall(10, this, "uint", ulCharOffset, "uint", cChars, "ptr", pas, BOOL, fScriptlet, "uint*", &pdwSourceContext := 0, "HRESULT")
        return pdwSourceContext
    }

    /**
     * 
     * @param {Integer} staTextAttr 
     * @returns {HRESULT} 
     */
    SetDefaultTextAttr(staTextAttr) {
        result := ComCall(11, this, "ushort", staTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @returns {HRESULT} 
     */
    SetTextAttributes(ulCharOffset, cChars, pstaTextAttr) {
        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "uint", ulCharOffset, "uint", cChars, pstaTextAttrMarshal, pstaTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLongName 
     * @returns {HRESULT} 
     */
    SetLongName(pszLongName) {
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(13, this, "ptr", pszLongName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszShortName 
     * @returns {HRESULT} 
     */
    SetShortName(pszShortName) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName

        result := ComCall(14, this, "ptr", pszShortName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pszAttributes 
     * @returns {HRESULT} 
     */
    SetDocumentAttr(pszAttributes) {
        result := ComCall(15, this, "uint", pszAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetDebugApplicationNode() {
        result := ComCall(16, this, "ptr*", &ppdan := 0, "HRESULT")
        return IDebugApplicationNode(ppdan)
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Pointer<IActiveScript>} ppasd 
     * @param {Pointer<Integer>} piCharPos 
     * @param {Pointer<Integer>} pcChars 
     * @returns {HRESULT} 
     */
    GetScriptBlockInfo(dwSourceContext, ppasd, piCharPos, pcChars) {
        piCharPosMarshal := piCharPos is VarRef ? "uint*" : "ptr"
        pcCharsMarshal := pcChars is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwSourceContext, IActiveScript.Ptr, ppasd, piCharPosMarshal, piCharPos, pcCharsMarshal, pcChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iCharPos 
     * @param {Integer} cChars 
     * @returns {IDebugDocumentContext} 
     */
    CreateDebugDocumentContext(iCharPos, cChars) {
        result := ComCall(18, this, "uint", iCharPos, "uint", cChars, "ptr*", &ppddc := 0, "HRESULT")
        return IDebugDocumentContext(ppddc)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BringDocumentToTop() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} pddc 
     * @returns {HRESULT} 
     */
    BringDocumentContextToTop(pddc) {
        result := ComCall(20, this, "ptr", pddc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugDocumentHelper32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 5)
        this.vtbl.Attach := CallbackCreate(GetMethod(implObj, "Attach"), flags, 2)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 1)
        this.vtbl.AddUnicodeText := CallbackCreate(GetMethod(implObj, "AddUnicodeText"), flags, 2)
        this.vtbl.AddDBCSText := CallbackCreate(GetMethod(implObj, "AddDBCSText"), flags, 2)
        this.vtbl.SetDebugDocumentHost := CallbackCreate(GetMethod(implObj, "SetDebugDocumentHost"), flags, 2)
        this.vtbl.AddDeferredText := CallbackCreate(GetMethod(implObj, "AddDeferredText"), flags, 3)
        this.vtbl.DefineScriptBlock := CallbackCreate(GetMethod(implObj, "DefineScriptBlock"), flags, 6)
        this.vtbl.SetDefaultTextAttr := CallbackCreate(GetMethod(implObj, "SetDefaultTextAttr"), flags, 2)
        this.vtbl.SetTextAttributes := CallbackCreate(GetMethod(implObj, "SetTextAttributes"), flags, 4)
        this.vtbl.SetLongName := CallbackCreate(GetMethod(implObj, "SetLongName"), flags, 2)
        this.vtbl.SetShortName := CallbackCreate(GetMethod(implObj, "SetShortName"), flags, 2)
        this.vtbl.SetDocumentAttr := CallbackCreate(GetMethod(implObj, "SetDocumentAttr"), flags, 2)
        this.vtbl.GetDebugApplicationNode := CallbackCreate(GetMethod(implObj, "GetDebugApplicationNode"), flags, 2)
        this.vtbl.GetScriptBlockInfo := CallbackCreate(GetMethod(implObj, "GetScriptBlockInfo"), flags, 5)
        this.vtbl.CreateDebugDocumentContext := CallbackCreate(GetMethod(implObj, "CreateDebugDocumentContext"), flags, 4)
        this.vtbl.BringDocumentToTop := CallbackCreate(GetMethod(implObj, "BringDocumentToTop"), flags, 1)
        this.vtbl.BringDocumentContextToTop := CallbackCreate(GetMethod(implObj, "BringDocumentContextToTop"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.Attach)
        CallbackFree(this.vtbl.Detach)
        CallbackFree(this.vtbl.AddUnicodeText)
        CallbackFree(this.vtbl.AddDBCSText)
        CallbackFree(this.vtbl.SetDebugDocumentHost)
        CallbackFree(this.vtbl.AddDeferredText)
        CallbackFree(this.vtbl.DefineScriptBlock)
        CallbackFree(this.vtbl.SetDefaultTextAttr)
        CallbackFree(this.vtbl.SetTextAttributes)
        CallbackFree(this.vtbl.SetLongName)
        CallbackFree(this.vtbl.SetShortName)
        CallbackFree(this.vtbl.SetDocumentAttr)
        CallbackFree(this.vtbl.GetDebugApplicationNode)
        CallbackFree(this.vtbl.GetScriptBlockInfo)
        CallbackFree(this.vtbl.CreateDebugDocumentContext)
        CallbackFree(this.vtbl.BringDocumentToTop)
        CallbackFree(this.vtbl.BringDocumentContextToTop)
    }
}
