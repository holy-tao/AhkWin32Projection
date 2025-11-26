#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Walks a stack frame looking for interesting values.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallframewalker
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallFrameWalker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFrameWalker
     * @type {Guid}
     */
    static IID => Guid("{08b23919-392d-11d2-b8a4-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWalkInterface"]

    /**
     * Walks through a call frame to look for the specified interface in the call frame. The interface can be manipulated or replaced by paying close attention to the reference count.
     * @param {Pointer<Guid>} iid The IID of the interface to be found.
     * @param {Pointer<Pointer<Void>>} ppvInterface A points to the buffer from which the activation record is to be reconstituted.
     * @param {BOOL} fIn This parameter is nonzero if an interface is inside an [in] or [in, out] parameter.
     * @param {BOOL} fOut This parameter is nonzero if an interface is inside an [out] or [in, out] parameter.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframewalker-onwalkinterface
     */
    OnWalkInterface(iid, ppvInterface, fIn, fOut) {
        ppvInterfaceMarshal := ppvInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", iid, ppvInterfaceMarshal, ppvInterface, "int", fIn, "int", fOut, "HRESULT")
        return result
    }
}
