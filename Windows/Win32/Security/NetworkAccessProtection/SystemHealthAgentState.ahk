#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FailureCategory.ahk" { FailureCategory }
#Import ".\FixupInfo.ahk" { FixupInfo }
#Import ".\ResultCodes.ahk" { ResultCodes }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FixupState.ahk" { FixupState }

/**
 * Stores the dynamic state of the SHA.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-systemhealthagentstate
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct SystemHealthAgentState {
    #StructPack 8

    /**
     * A unique <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">SystemHealthEntityId</a> value that identifies the System Health Agent (SHA).
     */
    id : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-resultcodes">ResultCodes</a> structure that contains the compliance result codes that were returned in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> received from the SHA.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeComplianceResultCodes</a> attribute type within the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> contains the compliance result codes.</div>
     * <div> </div>
     */
    shaResultCodes : ResultCodes

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-failurecategory">FailureCategory</a> value that describes the failure category fields that were returned in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> received from the SHA.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeFailureCategory</a> attribute type within the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoHRespnse</a> contains the failure category fields.</div>
     * <div> </div>
     */
    failureCategory : FailureCategory

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-fixupinfo">FixupInfo</a> structure that contains information about the fix-up state of the SHA.
     */
    fixupInfo : FixupInfo

}
