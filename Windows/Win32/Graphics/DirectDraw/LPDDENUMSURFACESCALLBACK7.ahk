#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The EnumSurfacesCallback7 function is an application-defined callback function for the IDirectDrawSurface7::EnumAttachedSurfaces and IDirectDrawSurface7::EnumOverlayZOrders methods.
 * @remarks
 * You can use the LPDDENUMSURFACESCALLBACK7 data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nc-ddraw-lpddenumsurfacescallback7
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class LPDDENUMSURFACESCALLBACK7 extends IUnknown {

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
     * @param {IDirectDrawSurface7} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
