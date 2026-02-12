#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintSupportIppCommunicationTimeouts.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportIppCommunicationConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportIppCommunicationConfiguration
     * @type {Guid}
     */
    static IID => Guid("{dbc36e0b-2d90-53b9-90d2-93faf30dafdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommunicationKind", "get_CanModifyTimeouts", "get_IppAttributeTimeouts", "get_IppJobTimeouts"]

    /**
     * @type {Integer} 
     */
    CommunicationKind {
        get => this.get_CommunicationKind()
    }

    /**
     * @type {Boolean} 
     */
    CanModifyTimeouts {
        get => this.get_CanModifyTimeouts()
    }

    /**
     * @type {PrintSupportIppCommunicationTimeouts} 
     */
    IppAttributeTimeouts {
        get => this.get_IppAttributeTimeouts()
    }

    /**
     * @type {PrintSupportIppCommunicationTimeouts} 
     */
    IppJobTimeouts {
        get => this.get_IppJobTimeouts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CommunicationKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyTimeouts() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationTimeouts} 
     */
    get_IppAttributeTimeouts() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintSupportIppCommunicationTimeouts(value)
    }

    /**
     * 
     * @returns {PrintSupportIppCommunicationTimeouts} 
     */
    get_IppJobTimeouts() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintSupportIppCommunicationTimeouts(value)
    }
}
