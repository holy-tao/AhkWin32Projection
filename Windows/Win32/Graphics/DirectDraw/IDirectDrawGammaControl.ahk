#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawGammaControl interface to adjust the red, green, and blue gamma ramp levels of the primary surface. This section is a reference to the methods of this interface.
 * @remarks
 * 
 * The <b>IDirectDrawGammaControl</b> interface is supported by DirectDrawSurface objects. That is, you can retrieve a pointer to the <b>IDirectDrawGammaControl</b> interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method of a DirectDrawSurface object and by specifying the IID_IDirectDrawGammaControl reference identifier in the <i>riid</i> parameter.
 * 
 * 
 * 
 * You can use the LPDIRECTDRAWGAMMACONTROL data type to declare a variable that contains a pointer to an <b>IDirectDrawGammaControl</b> interface. The Ddraw.h header file declares the data type with the following code:
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDrawGammaControl    FAR *LPDIRECTDRAWGAMMACONTROL;
 * 
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/nn-ddraw-idirectdrawgammacontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawGammaControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawGammaControl
     * @type {Guid}
     */
    static IID => Guid("{69c11c3e-b46b-11d1-ad7a-00c04fc29b4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGammaRamp", "SetGammaRamp"]

    /**
     * Retrieves the red, green, and blue gamma ramps for the primary surface.
     * @param {Integer} param0 
     * @param {Pointer<DDGAMMARAMP>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawgammacontrol-getgammaramp
     */
    GetGammaRamp(param0, param1) {
        result := ComCall(3, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Sets the red, green, and blue gamma ramps for the primary surface.
     * @param {Integer} param0 
     * @param {Pointer<DDGAMMARAMP>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawgammacontrol-setgammaramp
     */
    SetGammaRamp(param0, param1) {
        result := ComCall(4, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }
}
