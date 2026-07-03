#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\COPYFILE2_CREATE_OPLOCK_KEYS.ahk" { COPYFILE2_CREATE_OPLOCK_KEYS }
#Import ".\COPYFILE2_V2_FLAGS.ahk" { COPYFILE2_V2_FLAGS }
#Import ".\COPYFILE_FLAGS.ahk" { COPYFILE_FLAGS }
#Import ".\LPPROGRESS_ROUTINE.ahk" { LPPROGRESS_ROUTINE }
#Import ".\PCOPYFILE2_PROGRESS_ROUTINE.ahk" { PCOPYFILE2_PROGRESS_ROUTINE }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COPYFILE2_EXTENDED_PARAMETERS_V2 {
    #StructPack 8

    dwSize : UInt32

    dwCopyFlags : COPYFILE_FLAGS

    pfCancel : BOOL.Ptr

    pProgressRoutine : PCOPYFILE2_PROGRESS_ROUTINE

    pvCallbackContext : IntPtr

    dwCopyFlagsV2 : COPYFILE2_V2_FLAGS

    ioDesiredSize : UInt32

    ioDesiredRate : UInt32

    pProgressRoutineOld : LPPROGRESS_ROUTINE

    SourceOplockKeys : COPYFILE2_CREATE_OPLOCK_KEYS.Ptr

    reserved : IntPtr[6]

}
