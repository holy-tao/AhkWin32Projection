#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Transform.ahk

/**
 * Defines a transform that uses a compute shader.
 * @remarks
 * 
 * The transform implements the normal Shatzis methods by  implementing <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transform">ID2D1Transform</a>. In addition, the caller is passed an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo">ID2D1ComputeInfo</a> to describe the compute pass that the transform should execute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1computetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ComputeTransform extends ID2D1Transform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ComputeTransform
     * @type {Guid}
     */
    static IID => Guid("{0d85573c-01e3-4f7d-bfd9-0d60608bf3c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetComputeInfo", "CalculateThreadgroups"]

    /**
     * Sets the render information used to specify the compute shader pass.
     * @param {ID2D1ComputeInfo} computeInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo">ID2D1ComputeInfo</a>*</b>
     * 
     * The render information object to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-setcomputeinfo
     */
    SetComputeInfo(computeInfo) {
        result := ComCall(7, this, "ptr", computeInfo, "HRESULT")
        return result
    }

    /**
     * This method allows a compute-shader–based transform to select the number of thread groups to execute based on the number of output pixels it needs to fill.
     * @param {Pointer<RECT>} outputRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The output rectangle that will be filled by the compute transform.
     * @param {Pointer<Integer>} dimensionX Type: <b>UINT32*</b>
     * 
     * The number of threads in the x dimension.
     * @param {Pointer<Integer>} dimensionY Type: <b>UINT32*</b>
     * 
     * The number of threads in the y dimension.
     * @param {Pointer<Integer>} dimensionZ Type: <b>UINT32*</b>
     * 
     * The number of threads in the z dimension.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-calculatethreadgroups
     */
    CalculateThreadgroups(outputRect, dimensionX, dimensionY, dimensionZ) {
        dimensionXMarshal := dimensionX is VarRef ? "uint*" : "ptr"
        dimensionYMarshal := dimensionY is VarRef ? "uint*" : "ptr"
        dimensionZMarshal := dimensionZ is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", outputRect, dimensionXMarshal, dimensionX, dimensionYMarshal, dimensionY, dimensionZMarshal, dimensionZ, "HRESULT")
        return result
    }
}
