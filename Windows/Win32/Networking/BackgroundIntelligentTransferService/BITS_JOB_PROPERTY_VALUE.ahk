#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BG_AUTH_TARGET.ahk" { BG_AUTH_TARGET }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides the property value of the BITS job based on the value of the BITS_JOB_PROPERTY_ID enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ns-bits5_0-bits_job_property_value
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BITS_JOB_PROPERTY_VALUE {
    #StructPack 8

    /**
     * This value is returned when using the enum property ID 
     *       <b>BITS_JOB_PROPERTY_ID_COST_FLAGS</b> and is applied as the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_transfer_policy">transfer policy</a> on the BITS job.
     * 
     * This value is also used when using the <b>BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL_MS</b> to specify the minimum notification interval.
     */
    Dword : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ClsID', { type: Guid, offset: 0 })
        DefineProp(this.Prototype, 'Enable', { type: BOOL, offset: 0 })
        DefineProp(this.Prototype, 'Uint64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'Target', { type: BG_AUTH_TARGET, offset: 0 })
        this.DeleteProp("__New")
    }
}
