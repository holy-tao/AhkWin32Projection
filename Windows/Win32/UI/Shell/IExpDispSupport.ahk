#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IConnectionPoint.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods that allow the retrieval of properties, translation of keyboard accelerators, and determination of a connection point for certain events.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  <b>IExpDispSupport</b> might not be supported in versions of Windows later than Windows XP.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-iexpdispsupport
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExpDispSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpDispSupport
     * @type {Guid}
     */
    static IID => Guid("{0d7d1d00-6fc0-11d0-a974-00c04fd705a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindConnectionPoint", "OnTranslateAccelerator", "OnInvoke"]

    /**
     * Deprecated. Gets connection points for browser events.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * @returns {IConnectionPoint} Type: <b>CIE4ConnectionPoint**</b>
     * 
     * The address of a pointer to the browser connection point.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-iexpdispsupport-findconnectionpoint
     */
    FindConnectionPoint(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppccp := 0, "HRESULT")
        return IConnectionPoint(ppccp)
    }

    /**
     * Deprecated. Instructs the control site to process the keystroke described in pMsg and modified by the flags in grfModifiers.
     * @param {Pointer<MSG>} pMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that describes the keystroke to be processed.
     * @param {Integer} grfModifiers Type: <b>DWORD</b>
     * 
     * Flags describing the state of the CTRL, ALT, and SHIFT keys. The value of the flags can be any valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms683763(v=vs.85)">KEYMODIFIERS</a> enumeration value or values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the container processed the message, <b>S_FALSE</b> if the container did not process the message, or <b>E_NOTIMPL</b> if the container does not implement accelerator support.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-iexpdispsupport-ontranslateaccelerator
     */
    OnTranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(4, this, "ptr", pMsg, "uint", grfModifiers, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets ambient properties.
     * @param {Integer} dispidMember Type: <b>DISPID</b>
     * 
     * A dispatch ID that identifies the member being invoked.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * Reserved. Must be IID_NULL.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * A locale ID providing a locale context in which to interpret arguments. Applications that do not support multiple languages can ignore this parameter.
     * @param {Integer} wFlags Type: <b>WORD</b>
     * 
     * Flags describing the context of the call, including the following.
     * @param {Pointer<DISPPARAMS>} pdispparams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure containing an array of arguments, an array of argument DISPIDs for named arguments, and counts for the number of elements in the arrays.
     * @param {Pointer<VARIANT>} pVarResult Type: <b>VARIANT*</b>
     * 
     * A pointer to the location where the result is to be stored, or <b>NULL</b> if the caller expects no result. This argument is ignored if DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF is specified.
     * @param {Pointer<EXCEPINFO>} pexcepinfo Type: <b>EXCEPINFO*</b>
     * 
     * A pointer to a structure that contains exception information. This structure should be filled in if DISP_E_EXCEPTION is returned. Can be <b>NULL</b>.
     * @param {Pointer<Integer>} puArgErr Type: <b>UINT*</b>
     * 
     * The index within the <b>rgvarg</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure of the first argument that has an error. Arguments are stored in <b>rgvarg</b> in reverse order, so the first argument is the one with the highest index in the array. This parameter is returned only when the resulting return value is DISP_E_TYPEMISMATCH or DISP_E_PARAMNOTFOUND. This argument can be set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-iexpdispsupport-oninvoke
     */
    OnInvoke(dispidMember, iid, lcid, wFlags, pdispparams, pVarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, "ptr", iid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pVarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
