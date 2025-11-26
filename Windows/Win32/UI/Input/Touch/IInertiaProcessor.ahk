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
     * @type {Float} 
     */
    InitialOriginX {
        get => this.get_InitialOriginX()
        set => this.put_InitialOriginX(value)
    }

    /**
     * @type {Float} 
     */
    InitialOriginY {
        get => this.get_InitialOriginY()
        set => this.put_InitialOriginY(value)
    }

    /**
     * @type {Float} 
     */
    InitialVelocityX {
        get => this.get_InitialVelocityX()
        set => this.put_InitialVelocityX(value)
    }

    /**
     * @type {Float} 
     */
    InitialVelocityY {
        get => this.get_InitialVelocityY()
        set => this.put_InitialVelocityY(value)
    }

    /**
     * @type {Float} 
     */
    InitialAngularVelocity {
        get => this.get_InitialAngularVelocity()
        set => this.put_InitialAngularVelocity(value)
    }

    /**
     * @type {Float} 
     */
    InitialExpansionVelocity {
        get => this.get_InitialExpansionVelocity()
        set => this.put_InitialExpansionVelocity(value)
    }

    /**
     * @type {Float} 
     */
    InitialRadius {
        get => this.get_InitialRadius()
        set => this.put_InitialRadius(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryLeft {
        get => this.get_BoundaryLeft()
        set => this.put_BoundaryLeft(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryTop {
        get => this.get_BoundaryTop()
        set => this.put_BoundaryTop(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryRight {
        get => this.get_BoundaryRight()
        set => this.put_BoundaryRight(value)
    }

    /**
     * @type {Float} 
     */
    BoundaryBottom {
        get => this.get_BoundaryBottom()
        set => this.put_BoundaryBottom(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginLeft {
        get => this.get_ElasticMarginLeft()
        set => this.put_ElasticMarginLeft(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginTop {
        get => this.get_ElasticMarginTop()
        set => this.put_ElasticMarginTop(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginRight {
        get => this.get_ElasticMarginRight()
        set => this.put_ElasticMarginRight(value)
    }

    /**
     * @type {Float} 
     */
    ElasticMarginBottom {
        get => this.get_ElasticMarginBottom()
        set => this.put_ElasticMarginBottom(value)
    }

    /**
     * @type {Float} 
     */
    DesiredDisplacement {
        get => this.get_DesiredDisplacement()
        set => this.put_DesiredDisplacement(value)
    }

    /**
     * @type {Float} 
     */
    DesiredRotation {
        get => this.get_DesiredRotation()
        set => this.put_DesiredRotation(value)
    }

    /**
     * @type {Float} 
     */
    DesiredExpansion {
        get => this.get_DesiredExpansion()
        set => this.put_DesiredExpansion(value)
    }

    /**
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    DesiredAngularDeceleration {
        get => this.get_DesiredAngularDeceleration()
        set => this.put_DesiredAngularDeceleration(value)
    }

    /**
     * @type {Float} 
     */
    DesiredExpansionDeceleration {
        get => this.get_DesiredExpansionDeceleration()
        set => this.put_DesiredExpansionDeceleration(value)
    }

    /**
     * @type {Integer} 
     */
    InitialTimestamp {
        get => this.get_InitialTimestamp()
        set => this.put_InitialTimestamp(value)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginx
     */
    get_InitialOriginX() {
        result := ComCall(3, this, "float*", &x := 0, "HRESULT")
        return x
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialoriginy
     */
    get_InitialOriginY() {
        result := ComCall(5, this, "float*", &y := 0, "HRESULT")
        return y
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityx
     */
    get_InitialVelocityX() {
        result := ComCall(7, this, "float*", &x := 0, "HRESULT")
        return x
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialvelocityy
     */
    get_InitialVelocityY() {
        result := ComCall(9, this, "float*", &y := 0, "HRESULT")
        return y
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialangularvelocity
     */
    get_InitialAngularVelocity() {
        result := ComCall(11, this, "float*", &velocity := 0, "HRESULT")
        return velocity
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialexpansionvelocity
     */
    get_InitialExpansionVelocity() {
        result := ComCall(13, this, "float*", &velocity := 0, "HRESULT")
        return velocity
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialradius
     */
    get_InitialRadius() {
        result := ComCall(15, this, "float*", &radius := 0, "HRESULT")
        return radius
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryleft
     */
    get_BoundaryLeft() {
        result := ComCall(17, this, "float*", &left := 0, "HRESULT")
        return left
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarytop
     */
    get_BoundaryTop() {
        result := ComCall(19, this, "float*", &top := 0, "HRESULT")
        return top
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundaryright
     */
    get_BoundaryRight() {
        result := ComCall(21, this, "float*", &right := 0, "HRESULT")
        return right
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_boundarybottom
     */
    get_BoundaryBottom() {
        result := ComCall(23, this, "float*", &bottom := 0, "HRESULT")
        return bottom
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginleft
     */
    get_ElasticMarginLeft() {
        result := ComCall(25, this, "float*", &left := 0, "HRESULT")
        return left
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmargintop
     */
    get_ElasticMarginTop() {
        result := ComCall(27, this, "float*", &top := 0, "HRESULT")
        return top
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginright
     */
    get_ElasticMarginRight() {
        result := ComCall(29, this, "float*", &right := 0, "HRESULT")
        return right
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_elasticmarginbottom
     */
    get_ElasticMarginBottom() {
        result := ComCall(31, this, "float*", &bottom := 0, "HRESULT")
        return bottom
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddisplacement
     */
    get_DesiredDisplacement() {
        result := ComCall(33, this, "float*", &displacement := 0, "HRESULT")
        return displacement
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredrotation
     */
    get_DesiredRotation() {
        result := ComCall(35, this, "float*", &rotation := 0, "HRESULT")
        return rotation
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansion
     */
    get_DesiredExpansion() {
        result := ComCall(37, this, "float*", &expansion := 0, "HRESULT")
        return expansion
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desireddeceleration
     */
    get_DesiredDeceleration() {
        result := ComCall(39, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredangulardeceleration
     */
    get_DesiredAngularDeceleration() {
        result := ComCall(41, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
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
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_desiredexpansiondeceleration
     */
    get_DesiredExpansionDeceleration() {
        result := ComCall(43, this, "float*", &deceleration := 0, "HRESULT")
        return deceleration
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-get_initialtimestamp
     */
    get_InitialTimestamp() {
        result := ComCall(45, this, "uint*", &timestamp := 0, "HRESULT")
        return timestamp
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
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-process
     */
    Process() {
        result := ComCall(48, this, "int*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * 
     * @param {Integer} timestamp 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/manipulations/nf-manipulations-iinertiaprocessor-processtime
     */
    ProcessTime(timestamp) {
        result := ComCall(49, this, "uint", timestamp, "int*", &completed := 0, "HRESULT")
        return completed
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
