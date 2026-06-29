#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPTMTHREADINFO {
    #StructPack 4

    lPoolSize : Int32

    lPriority : Int32

    ulConcurrencyLimit : UInt32

    ulMaxQuickAllocThreads : UInt32

}
