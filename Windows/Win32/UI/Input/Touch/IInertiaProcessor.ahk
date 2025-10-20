#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IInertiaProcessor interface handles calculations regarding object motion for Windows Touch.
 * @see https://docs.microsoft.com/windows/win32/api//manipulations/nn-manipulations-iinertiaprocessor
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class IInertiaProcessor extends IUnknown{
    /**
     * The interface identifier for IInertiaProcessor
     * @type {Guid}
     */
    static IID => Guid("{18b00c6d-c5ee-41b1-90a9-9d4a929095ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Single>} x 
     * @returns {HRESULT} 
     */
    get_InitialOriginX(x) {
        result := ComCall(3, this, "float*", x, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @returns {HRESULT} 
     */
    put_InitialOriginX(x) {
        result := ComCall(4, this, "float", x, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} y 
     * @returns {HRESULT} 
     */
    get_InitialOriginY(y) {
        result := ComCall(5, this, "float*", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    put_InitialOriginY(y) {
        result := ComCall(6, this, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} x 
     * @returns {HRESULT} 
     */
    get_InitialVelocityX(x) {
        result := ComCall(7, this, "float*", x, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @returns {HRESULT} 
     */
    put_InitialVelocityX(x) {
        result := ComCall(8, this, "float", x, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} y 
     * @returns {HRESULT} 
     */
    get_InitialVelocityY(y) {
        result := ComCall(9, this, "float*", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    put_InitialVelocityY(y) {
        result := ComCall(10, this, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} velocity 
     * @returns {HRESULT} 
     */
    get_InitialAngularVelocity(velocity) {
        result := ComCall(11, this, "float*", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     */
    put_InitialAngularVelocity(velocity) {
        result := ComCall(12, this, "float", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} velocity 
     * @returns {HRESULT} 
     */
    get_InitialExpansionVelocity(velocity) {
        result := ComCall(13, this, "float*", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     */
    put_InitialExpansionVelocity(velocity) {
        result := ComCall(14, this, "float", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} radius 
     * @returns {HRESULT} 
     */
    get_InitialRadius(radius) {
        result := ComCall(15, this, "float*", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     */
    put_InitialRadius(radius) {
        result := ComCall(16, this, "float", radius, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} left 
     * @returns {HRESULT} 
     */
    get_BoundaryLeft(left) {
        result := ComCall(17, this, "float*", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     */
    put_BoundaryLeft(left) {
        result := ComCall(18, this, "float", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} top 
     * @returns {HRESULT} 
     */
    get_BoundaryTop(top) {
        result := ComCall(19, this, "float*", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     */
    put_BoundaryTop(top) {
        result := ComCall(20, this, "float", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} right 
     * @returns {HRESULT} 
     */
    get_BoundaryRight(right) {
        result := ComCall(21, this, "float*", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     */
    put_BoundaryRight(right) {
        result := ComCall(22, this, "float", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} bottom 
     * @returns {HRESULT} 
     */
    get_BoundaryBottom(bottom) {
        result := ComCall(23, this, "float*", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     */
    put_BoundaryBottom(bottom) {
        result := ComCall(24, this, "float", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} left 
     * @returns {HRESULT} 
     */
    get_ElasticMarginLeft(left) {
        result := ComCall(25, this, "float*", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     */
    put_ElasticMarginLeft(left) {
        result := ComCall(26, this, "float", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} top 
     * @returns {HRESULT} 
     */
    get_ElasticMarginTop(top) {
        result := ComCall(27, this, "float*", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     */
    put_ElasticMarginTop(top) {
        result := ComCall(28, this, "float", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} right 
     * @returns {HRESULT} 
     */
    get_ElasticMarginRight(right) {
        result := ComCall(29, this, "float*", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     */
    put_ElasticMarginRight(right) {
        result := ComCall(30, this, "float", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} bottom 
     * @returns {HRESULT} 
     */
    get_ElasticMarginBottom(bottom) {
        result := ComCall(31, this, "float*", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     */
    put_ElasticMarginBottom(bottom) {
        result := ComCall(32, this, "float", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} displacement 
     * @returns {HRESULT} 
     */
    get_DesiredDisplacement(displacement) {
        result := ComCall(33, this, "float*", displacement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} displacement 
     * @returns {HRESULT} 
     */
    put_DesiredDisplacement(displacement) {
        result := ComCall(34, this, "float", displacement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} rotation 
     * @returns {HRESULT} 
     */
    get_DesiredRotation(rotation) {
        result := ComCall(35, this, "float*", rotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} rotation 
     * @returns {HRESULT} 
     */
    put_DesiredRotation(rotation) {
        result := ComCall(36, this, "float", rotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} expansion 
     * @returns {HRESULT} 
     */
    get_DesiredExpansion(expansion) {
        result := ComCall(37, this, "float*", expansion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} expansion 
     * @returns {HRESULT} 
     */
    put_DesiredExpansion(expansion) {
        result := ComCall(38, this, "float", expansion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} deceleration 
     * @returns {HRESULT} 
     */
    get_DesiredDeceleration(deceleration) {
        result := ComCall(39, this, "float*", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     */
    put_DesiredDeceleration(deceleration) {
        result := ComCall(40, this, "float", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} deceleration 
     * @returns {HRESULT} 
     */
    get_DesiredAngularDeceleration(deceleration) {
        result := ComCall(41, this, "float*", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     */
    put_DesiredAngularDeceleration(deceleration) {
        result := ComCall(42, this, "float", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} deceleration 
     * @returns {HRESULT} 
     */
    get_DesiredExpansionDeceleration(deceleration) {
        result := ComCall(43, this, "float*", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     */
    put_DesiredExpansionDeceleration(deceleration) {
        result := ComCall(44, this, "float", deceleration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} timestamp 
     * @returns {HRESULT} 
     */
    get_InitialTimestamp(timestamp) {
        result := ComCall(45, this, "uint*", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     */
    put_InitialTimestamp(timestamp) {
        result := ComCall(46, this, "uint", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Performs ink recognition synchronously.
     * @param {Pointer<BOOL>} completed 
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not process the ink because the ink has been fully processed, or the <a href="/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function has not been called and the recognizer does not support incremental processing of ink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_INTERRUPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was interrupted by a call to the <a href="/windows/desktop/api/recapis/nf-recapis-adviseinkchange">AdviseInkChange</a> function.
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
     * One of the parameters is an invalid pointer.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-process
     */
    Process(completed) {
        result := ComCall(48, this, "ptr", completed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @param {Pointer<BOOL>} completed 
     * @returns {HRESULT} 
     */
    ProcessTime(timestamp, completed) {
        result := ComCall(49, this, "uint", timestamp, "ptr", completed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Complete() {
        result := ComCall(50, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     */
    CompleteTime(timestamp) {
        result := ComCall(51, this, "uint", timestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
