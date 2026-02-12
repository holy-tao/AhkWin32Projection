#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRESUTIL_ENUM_RESOURCES extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HRESOURCE} hSelf 
     * @param {PWSTR} lpszResTypeName 
     * @param {Pointer<LPRESOURCE_CALLBACK>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSelf, lpszResTypeName, pResCallBack, pParameter) {
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hSelf, "ptr", lpszResTypeName, "ptr", pResCallBack, pParameterMarshal, pParameter, "uint")
        return result
    }
}
