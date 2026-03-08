#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelectElement5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelectElement5
     * @type {Guid}
     */
    static IID => Guid("{3051049d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add"]

    /**
     * Component-wise add of 2 vectors.
     * @remarks
     * The following table shows the results obtained when executing the instruction with various classes of numbers, assuming that neither overflow or underflow occurs. F means finite real number.
     * 
     * 
     * 
     * | **src0 src1->** | **-inf** | **-F**     | **-denorm** | **-0** | **+0** | **denorm** | **+F**     | **+inf** | **NaN** |
     * |--------------------|----------|------------|-------------|--------|--------|------------|------------|----------|---------|
     * | **-inf**           | -inf     | -inf       | -inf        | -inf   | -inf   | -inf       | -inf       | NaN      | NaN     |
     * | **-F**             | -inf     | -F         | src0        | src0   | src0   | src0       | +-F or +-0 | +inf     | NaN     |
     * | **-denorm**        | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **-0**             | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+0**             | i-inf    | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+denorm**        | -inf     | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+F**             | -inf     | +-F or +-0 | src0        | src0   | src0   | src0       | +F         | +inf     | NaN     |
     * | **+inf**           | NaN      | +inf       | +inf        | +inf   | +inf   | +inf       | +inf       | +inf     | NaN     |
     * | **NaN**            | NaN      | NaN        | NaN         | NaN    | NaN    | NaN        | NaN        | NaN      | NaN     |
     * 
     * 
     * 
     *  
     * 
     * This instruction applies to the following shader stages:
     * 
     * 
     * 
     * | Vertex Shader | Geometry Shader | Pixel Shader |
     * |---------------|-----------------|--------------|
     * | x             | x               | x            |
     * @param {IHTMLOptionElement} pElem 
     * @param {Pointer<VARIANT>} pvarBefore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/add--sm4---asm-
     */
    add(pElem, pvarBefore) {
        result := ComCall(7, this, "ptr", pElem, "ptr", pvarBefore, "HRESULT")
        return result
    }
}
