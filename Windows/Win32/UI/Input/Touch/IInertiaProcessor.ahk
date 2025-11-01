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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialOriginX", "put_InitialOriginX", "get_InitialOriginY", "put_InitialOriginY", "get_InitialVelocityX", "put_InitialVelocityX", "get_InitialVelocityY", "put_InitialVelocityY", "get_InitialAngularVelocity", "put_InitialAngularVelocity", "get_InitialExpansionVelocity", "put_InitialExpansionVelocity", "get_InitialRadius", "put_InitialRadius", "get_BoundaryLeft", "put_BoundaryLeft", "get_BoundaryTop", "put_BoundaryTop", "get_BoundaryRight", "put_BoundaryRight", "get_BoundaryBottom", "put_BoundaryBottom", "get_ElasticMarginLeft", "put_ElasticMarginLeft", "get_ElasticMarginTop", "put_ElasticMarginTop", "get_ElasticMarginRight", "put_ElasticMarginRight", "get_ElasticMarginBottom", "put_ElasticMarginBottom", "get_DesiredDisplacement", "put_DesiredDisplacement", "get_DesiredRotation", "put_DesiredRotation", "get_DesiredExpansion", "put_DesiredExpansion", "get_DesiredDeceleration", "put_DesiredDeceleration", "get_DesiredAngularDeceleration", "put_DesiredAngularDeceleration", "get_DesiredExpansionDeceleration", "put_DesiredExpansionDeceleration", "get_InitialTimestamp", "put_InitialTimestamp", "Reset", "Process", "ProcessTime", "Complete", "CompleteTime"]

    /**
     * 
     * @param {Pointer<Float>} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginx
     */
    get_InitialOriginX(x) {
        xMarshal := x is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, xMarshal, x, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialoriginx
     */
    put_InitialOriginX(x) {
        result := ComCall(4, this, "float", x, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginy
     */
    get_InitialOriginY(y) {
        yMarshal := y is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, yMarshal, y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialoriginy
     */
    put_InitialOriginY(y) {
        result := ComCall(6, this, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityx
     */
    get_InitialVelocityX(x) {
        xMarshal := x is VarRef ? "float*" : "ptr"

        result := ComCall(7, this, xMarshal, x, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialvelocityx
     */
    put_InitialVelocityX(x) {
        result := ComCall(8, this, "float", x, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityy
     */
    get_InitialVelocityY(y) {
        yMarshal := y is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, yMarshal, y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialvelocityy
     */
    put_InitialVelocityY(y) {
        result := ComCall(10, this, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialangularvelocity
     */
    get_InitialAngularVelocity(velocity) {
        velocityMarshal := velocity is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, velocityMarshal, velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialangularvelocity
     */
    put_InitialAngularVelocity(velocity) {
        result := ComCall(12, this, "float", velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialexpansionvelocity
     */
    get_InitialExpansionVelocity(velocity) {
        velocityMarshal := velocity is VarRef ? "float*" : "ptr"

        result := ComCall(13, this, velocityMarshal, velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialexpansionvelocity
     */
    put_InitialExpansionVelocity(velocity) {
        result := ComCall(14, this, "float", velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialradius
     */
    get_InitialRadius(radius) {
        radiusMarshal := radius is VarRef ? "float*" : "ptr"

        result := ComCall(15, this, radiusMarshal, radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} radius 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialradius
     */
    put_InitialRadius(radius) {
        result := ComCall(16, this, "float", radius, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryleft
     */
    get_BoundaryLeft(left) {
        leftMarshal := left is VarRef ? "float*" : "ptr"

        result := ComCall(17, this, leftMarshal, left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundaryleft
     */
    put_BoundaryLeft(left) {
        result := ComCall(18, this, "float", left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarytop
     */
    get_BoundaryTop(top) {
        topMarshal := top is VarRef ? "float*" : "ptr"

        result := ComCall(19, this, topMarshal, top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundarytop
     */
    put_BoundaryTop(top) {
        result := ComCall(20, this, "float", top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryright
     */
    get_BoundaryRight(right) {
        rightMarshal := right is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, rightMarshal, right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundaryright
     */
    put_BoundaryRight(right) {
        result := ComCall(22, this, "float", right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarybottom
     */
    get_BoundaryBottom(bottom) {
        bottomMarshal := bottom is VarRef ? "float*" : "ptr"

        result := ComCall(23, this, bottomMarshal, bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_boundarybottom
     */
    put_BoundaryBottom(bottom) {
        result := ComCall(24, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginleft
     */
    get_ElasticMarginLeft(left) {
        leftMarshal := left is VarRef ? "float*" : "ptr"

        result := ComCall(25, this, leftMarshal, left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginleft
     */
    put_ElasticMarginLeft(left) {
        result := ComCall(26, this, "float", left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmargintop
     */
    get_ElasticMarginTop(top) {
        topMarshal := top is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, topMarshal, top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmargintop
     */
    put_ElasticMarginTop(top) {
        result := ComCall(28, this, "float", top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginright
     */
    get_ElasticMarginRight(right) {
        rightMarshal := right is VarRef ? "float*" : "ptr"

        result := ComCall(29, this, rightMarshal, right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginright
     */
    put_ElasticMarginRight(right) {
        result := ComCall(30, this, "float", right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginbottom
     */
    get_ElasticMarginBottom(bottom) {
        bottomMarshal := bottom is VarRef ? "float*" : "ptr"

        result := ComCall(31, this, bottomMarshal, bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_elasticmarginbottom
     */
    put_ElasticMarginBottom(bottom) {
        result := ComCall(32, this, "float", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} displacement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddisplacement
     */
    get_DesiredDisplacement(displacement) {
        displacementMarshal := displacement is VarRef ? "float*" : "ptr"

        result := ComCall(33, this, displacementMarshal, displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} displacement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desireddisplacement
     */
    put_DesiredDisplacement(displacement) {
        result := ComCall(34, this, "float", displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} rotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation
     */
    get_DesiredRotation(rotation) {
        rotationMarshal := rotation is VarRef ? "float*" : "ptr"

        result := ComCall(35, this, rotationMarshal, rotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} rotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredrotation
     */
    put_DesiredRotation(rotation) {
        result := ComCall(36, this, "float", rotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} expansion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion
     */
    get_DesiredExpansion(expansion) {
        expansionMarshal := expansion is VarRef ? "float*" : "ptr"

        result := ComCall(37, this, expansionMarshal, expansion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} expansion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredexpansion
     */
    put_DesiredExpansion(expansion) {
        result := ComCall(38, this, "float", expansion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddeceleration
     */
    get_DesiredDeceleration(deceleration) {
        decelerationMarshal := deceleration is VarRef ? "float*" : "ptr"

        result := ComCall(39, this, decelerationMarshal, deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desireddeceleration
     */
    put_DesiredDeceleration(deceleration) {
        result := ComCall(40, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration
     */
    get_DesiredAngularDeceleration(deceleration) {
        decelerationMarshal := deceleration is VarRef ? "float*" : "ptr"

        result := ComCall(41, this, decelerationMarshal, deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredangulardeceleration
     */
    put_DesiredAngularDeceleration(deceleration) {
        result := ComCall(42, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration
     */
    get_DesiredExpansionDeceleration(deceleration) {
        decelerationMarshal := deceleration is VarRef ? "float*" : "ptr"

        result := ComCall(43, this, decelerationMarshal, deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} deceleration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_desiredexpansiondeceleration
     */
    put_DesiredExpansionDeceleration(deceleration) {
        result := ComCall(44, this, "float", deceleration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialtimestamp
     */
    get_InitialTimestamp(timestamp) {
        timestampMarshal := timestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, timestampMarshal, timestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-put_initialtimestamp
     */
    put_InitialTimestamp(timestamp) {
        result := ComCall(46, this, "uint", timestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-reset
     */
    Reset() {
        result := ComCall(47, this, "HRESULT")
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
        result := ComCall(48, this, "ptr", completed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @param {Pointer<BOOL>} completed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-processtime
     */
    ProcessTime(timestamp, completed) {
        result := ComCall(49, this, "uint", timestamp, "ptr", completed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-complete
     */
    Complete() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-completetime
     */
    CompleteTime(timestamp) {
        result := ComCall(51, this, "uint", timestamp, "HRESULT")
        return result
    }
}
