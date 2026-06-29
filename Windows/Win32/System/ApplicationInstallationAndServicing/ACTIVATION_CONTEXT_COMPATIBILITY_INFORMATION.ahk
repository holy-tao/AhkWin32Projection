#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACTCTX_COMPATIBILITY_ELEMENT_TYPE.ahk" { ACTCTX_COMPATIBILITY_ELEMENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMPATIBILITY_CONTEXT_ELEMENT.ahk" { COMPATIBILITY_CONTEXT_ELEMENT }

/**
 * The ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION structure is used by the QueryActCtxW function.
 * @remarks
 * The following example requires Windows Server 2008 R2 or Windows 7 and shows the method to retrieve information about the compatibility context.
 * 
 * 
 * ``` syntax
 * HANDLE   ActCtxHandle=INVALID_HANDLE_VALUE;
 * SIZE_T   BytesWritten=0;
 * PACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION CtxCompatInfo=NULL;
 * 
 * // Query the compatibility information size
 * bReturn = QueryActCtxW(0, 
 *                        ActCtxHandle,
 *                        NULL,
 *                        CompatibilityInformationInActivationContext,
 *                        NULL,
 *                        0,
 *                        &amp;BytesWritten);
 * 
 * if (bReturn == FALSE &amp;&amp; GetLastError() !=ERROR_INSUFFICIENT_BUFFER)
 *        {
 * 	 goto EXIT;
 * 	 }
 * 	 
 * CtxCompatInfo = 
 * (PACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION)HeapAlloc(GetProcessHeap(), 
 *     HEAP_ZERO_MEMORY, BytesWritten);
 * 
 * if (CtxCompatInfo==NULL)
 *        {
 * 	 // Out of memory
 * 	 goto EXIT;
 * 	 }
 * 
 * // Query the compatibility information
 * bReturn = QueryActCtxW(0,
 *                        ActCtxHandle,
 *                        NULL,
 *                        CompatibilityInformationInActivationContext,
 *                        CtxCompatInfo,
 *                        BytesWritten,
 *                        &amp;BytesWritten);
 * 
 * if (bReturn==FALSE)
 *        {
 *         // Unexpected error: use GetLastError() to check
 *         goto EXIT;
 * 	 }
 * 
 * for (DWORD ElementIndex=0; ElementIndex &lt; CtxCompatInfo-&gt;ElementCount; ElementIndex ++)
 * {
 * PCOMPATIBILITY_CONTEXT_ELEMENT ContextElement = &amp;CtxCompatInfo-&gt;Elements[ElementIndex];
 * if (ContextElement-&gt;Type == ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS)
 *        {
 *        if (memcmp(&amp;ContextElement-&gt;Id, &amp;WIN7_CONTEXT_GUID, sizeof (GUID))==0)
 *              {printf_s("Windows 7 is supported");}
 * 	 }
 * }
 * 	 
 * EXIT:
 * if (ActCtxHandle != INVALID_HANDLE_VALUE) 
 *        {
 *         ReleaseActCtx (ActCtxHandle)
 * 	 }
 * if (CtxCompatInfo != NULL)
 *        {
 *         RtlFreeHeap (RtlProcessHeap (), 0, CtxCompatInfo);
 *         CtxCompatInfo = NULL;
 * 	 }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-activation_context_compatibility_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION {
    #StructPack 8

    /**
     * The number of compatibility elements defined in the application manifest.
     */
    ElementCount : UInt32

    /**
     * This is an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-compatibility_context_element">COMPATIBILITY_CONTEXT_ELEMENT</a> structures. Each structure describes one compatibility element in the application manifest.
     */
    Elements : COMPATIBILITY_CONTEXT_ELEMENT[1]

}
