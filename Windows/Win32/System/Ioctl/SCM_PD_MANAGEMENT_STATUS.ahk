#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_OPERATIONAL_STATUS.ahk" { SCM_PD_OPERATIONAL_STATUS }
#Import ".\SCM_PD_HEALTH_STATUS.ahk" { SCM_PD_HEALTH_STATUS }
#Import ".\SCM_PD_OPERATIONAL_STATUS_REASON.ahk" { SCM_PD_OPERATIONAL_STATUS_REASON }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_MANAGEMENT_STATUS {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Health : SCM_PD_HEALTH_STATUS

    NumberOfOperationalStatus : UInt32

    NumberOfAdditionalReasons : UInt32

    OperationalStatus : SCM_PD_OPERATIONAL_STATUS[16]

    AdditionalReasons : SCM_PD_OPERATIONAL_STATUS_REASON[1]

}
