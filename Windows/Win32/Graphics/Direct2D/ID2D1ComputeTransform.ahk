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
     * 
     * @param {ID2D1ComputeInfo} computeInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-setcomputeinfo
     */
    SetComputeInfo(computeInfo) {
        result := ComCall(7, this, "ptr", computeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} outputRect 
     * @param {Pointer<Integer>} dimensionX 
     * @param {Pointer<Integer>} dimensionY 
     * @param {Pointer<Integer>} dimensionZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computetransform-calculatethreadgroups
     */
    CalculateThreadgroups(outputRect, dimensionX, dimensionY, dimensionZ) {
        result := ComCall(8, this, "ptr", outputRect, "uint*", dimensionX, "uint*", dimensionY, "uint*", dimensionZ, "HRESULT")
        return result
    }
}
