#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Creates a call object for processing calls to the methods of an asynchronous interface.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icallfactory
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICallFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFactory
     * @type {Guid}
     */
    static IID => Guid("{1c733a30-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCall"]

    /**
     * Creates an instance of the call object that corresponds to a specified asynchronous interface.
     * @param {Pointer<Guid>} riid A reference to the identifier for the asynchronous interface.
     * @param {IUnknown} pCtrlUnk A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the call object. If this parameter is not <b>NULL</b>, the call object is aggregated in the specified object, and the <i>riid2</i> parameter must be IID_IUnknown.
     * If this parameter is <b>NULL</b>, the call object is not aggregated.
     * @param {Pointer<Guid>} riid2 The identifier of an interface on the call object. Typical values are IID_IUnknown and IID_ISynchronize.
     * @returns {IUnknown} The address of a pointer to the interface specified by <i>riid2</i>. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-icallfactory-createcall
     */
    CreateCall(riid, pCtrlUnk, riid2) {
        result := ComCall(3, this, "ptr", riid, "ptr", pCtrlUnk, "ptr", riid2, "ptr*", &ppv := 0, "HRESULT")
        return IUnknown(ppv)
    }
}
