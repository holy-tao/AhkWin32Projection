#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICmsTimestampInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICmsTimestampInfo
     * @type {Guid}
     */
    static IID => Guid("{2f5f00f2-2c18-4f88-8435-c534086076f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SigningCertificate", "get_Certificates", "get_Timestamp"]

    /**
     * @type {Certificate} 
     */
    SigningCertificate {
        get => this.get_SigningCertificate()
    }

    /**
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_SigningCertificate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_Certificates() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Certificate, value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
