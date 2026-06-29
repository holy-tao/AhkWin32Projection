#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The INFCONTEXT structure stores context information that functions such as SetupGetLineText use to navigate INF files.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-infcontext
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct INFCONTEXT {
    #StructPack 8

    /**
     * Handle to the INF file returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopeninffilea">SetupOpenInfFile</a>.
     */
    Inf : IntPtr

    /**
     * Pointer to the current INF file. The <b>Inf</b> member may point to multiple files if they were appended to the open INF file using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopenappendinffilea">SetupOpenAppendInfFile</a>.
     */
    CurrentInf : IntPtr

    /**
     * Section in the current INF file.
     */
    Section : UInt32

    /**
     * Line of the current section in the INF file. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>    The setup functions use this structure internally and it must not be accessed or modified by applications. It is included here for informational purposes only.</div>
     * <div> </div>
     */
    Line : UInt32

}
