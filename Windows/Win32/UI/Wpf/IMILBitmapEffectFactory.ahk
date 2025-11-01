#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to create Windows Presentation Foundation (WPF) Microsoft Win32 bitmap effect objects.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectfactory
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectFactory
     * @type {Guid}
     */
    static IID => Guid("{33a9df34-a403-4ec7-b07e-bc0682370845}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEffect", "CreateContext", "CreateEffectOuter"]

    /**
     * 
     * @param {Pointer<Guid>} pguidEffect 
     * @param {Pointer<IMILBitmapEffect>} ppEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffect
     */
    CreateEffect(pguidEffect, ppEffect) {
        result := ComCall(3, this, "ptr", pguidEffect, "ptr*", ppEffect, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context.
     * @param {Pointer<IMILBitmapEffectRenderContext>} ppContext 
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-createcontext
     */
    CreateContext(ppContext) {
        result := ComCall(4, this, "ptr*", ppContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffect>} ppEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectfactory-createeffectouter
     */
    CreateEffectOuter(ppEffect) {
        result := ComCall(5, this, "ptr*", ppEffect, "HRESULT")
        return result
    }
}
