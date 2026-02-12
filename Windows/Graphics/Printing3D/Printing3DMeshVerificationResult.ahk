#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DMeshVerificationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [VerifyAsync](printing3dmesh_verifyasync_784165027.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmeshverificationresult
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMeshVerificationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DMeshVerificationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DMeshVerificationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the mesh is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmeshverificationresult.isvalid
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * Gets the triangles with non-manifold edges, if applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmeshverificationresult.nonmanifoldtriangles
     * @type {IVectorView<Integer>} 
     */
    NonmanifoldTriangles {
        get => this.get_NonmanifoldTriangles()
    }

    /**
     * Gets the reverse normal triangles, if applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmeshverificationresult.reversednormaltriangles
     * @type {IVectorView<Integer>} 
     */
    ReversedNormalTriangles {
        get => this.get_ReversedNormalTriangles()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
        if (!this.HasProp("__IPrinting3DMeshVerificationResult")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMeshVerificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMeshVerificationResult := IPrinting3DMeshVerificationResult(outPtr)
        }

        return this.__IPrinting3DMeshVerificationResult.get_IsValid()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_NonmanifoldTriangles() {
        if (!this.HasProp("__IPrinting3DMeshVerificationResult")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMeshVerificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMeshVerificationResult := IPrinting3DMeshVerificationResult(outPtr)
        }

        return this.__IPrinting3DMeshVerificationResult.get_NonmanifoldTriangles()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ReversedNormalTriangles() {
        if (!this.HasProp("__IPrinting3DMeshVerificationResult")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMeshVerificationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMeshVerificationResult := IPrinting3DMeshVerificationResult(outPtr)
        }

        return this.__IPrinting3DMeshVerificationResult.get_ReversedNormalTriangles()
    }

;@endregion Instance Methods
}
