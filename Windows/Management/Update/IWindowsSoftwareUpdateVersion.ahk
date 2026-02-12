#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateVersion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateVersion
     * @type {Guid}
     */
    static IID => Guid("{215e22e7-6d57-5305-9c79-4ecd4a4d7871}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Major", "get_Minor", "get_RevisionMajor", "get_RevisionMinor"]

    /**
     * @type {Integer} 
     */
    Major {
        get => this.get_Major()
    }

    /**
     * @type {Integer} 
     */
    Minor {
        get => this.get_Minor()
    }

    /**
     * @type {Integer} 
     */
    RevisionMajor {
        get => this.get_RevisionMajor()
    }

    /**
     * @type {Integer} 
     */
    RevisionMinor {
        get => this.get_RevisionMinor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Major() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minor() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RevisionMajor() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RevisionMinor() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
