#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ResultCodes.ahk
#Include .\FixupInfo.ahk

/**
 * Stores the dynamic state of the SHA.
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-systemhealthagentstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class SystemHealthAgentState extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A unique <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">SystemHealthEntityId</a> value that identifies the System Health Agent (SHA).
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-resultcodes">ResultCodes</a> structure that contains the compliance result codes that were returned in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> received from the SHA.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeComplianceResultCodes</a> attribute type within the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> contains the compliance result codes.</div>
     * <div> </div>
     * @type {ResultCodes}
     */
    shaResultCodes{
        get {
            if(!this.HasProp("__shaResultCodes"))
                this.__shaResultCodes := ResultCodes(this.ptr + 8)
            return this.__shaResultCodes
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">FailureCategory</a> value that describes the failure category fields that were returned in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> received from the SHA.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeFailureCategory</a> attribute type within the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> contains the failure category fields.</div>
     * <div> </div>
     * @type {Integer}
     */
    failureCategory {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-fixupinfo">FixupInfo</a> structure that contains information about the fix-up state of the SHA.
     * @type {FixupInfo}
     */
    fixupInfo{
        get {
            if(!this.HasProp("__fixupInfo"))
                this.__fixupInfo := FixupInfo(this.ptr + 32)
            return this.__fixupInfo
        }
    }
}
