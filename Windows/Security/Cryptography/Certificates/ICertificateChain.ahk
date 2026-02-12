#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateChain extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateChain
     * @type {Guid}
     */
    static IID => Guid("{20bf5385-3691-4501-a62c-fd97278b31ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Validate", "ValidateWithParameters", "GetCertificates"]

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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/validatebitmapinfoheader
     */
    Validate() {
        result := ComCall(6, this, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }

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
     * @param {ChainValidationParameters} parameter 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/validatebitmapinfoheader
     */
    ValidateWithParameters(parameter) {
        result := ComCall(7, this, "ptr", parameter, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }

    /**
     * 
     * @param {Boolean} includeRoot 
     * @returns {IVectorView<Certificate>} 
     */
    GetCertificates(includeRoot) {
        result := ComCall(8, this, "int", includeRoot, "ptr*", &certificates := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Certificate, certificates)
    }
}
