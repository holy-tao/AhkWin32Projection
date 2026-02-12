#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcOperationResult.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcValidator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcValidator
     * @type {Guid}
     */
    static IID => Guid("{a6e82bd2-1fd7-4826-9811-2857e797f49a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Validate"]

    /**
     * The ValidateBitmapInfoHeader function checks a BITMAPINFOHEADER structure for certain common errors that can cause buffer overruns or integer overflows.
     * @remarks
     * This function guards against the following errors:
     * 
     * -   Arithmetic overflow in the structure size or an invalid structure size.
     * -   Invalid value for the **biClrUsed** member.
     * -   Arithmetic overflow in the image size (**biSizeImage**).
     * -   Invalid values for the image size (**biSizeImage**) for RGB formats.
     * 
     * The function does not check whether the structure describes a valid video format.
     * @param {IDxcBlob} pShader 
     * @param {Integer} Flags 
     * @returns {Pointer<IDxcOperationResult>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/validatebitmapinfoheader
     */
    Validate(pShader, Flags) {
        result := ComCall(3, this, "ptr", pShader, "uint", Flags, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }
}
