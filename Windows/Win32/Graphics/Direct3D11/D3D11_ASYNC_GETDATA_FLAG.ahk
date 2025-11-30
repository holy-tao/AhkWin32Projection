#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Optional flags that control the behavior of ID3D11DeviceContext::GetData.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_async_getdata_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_ASYNC_GETDATA_FLAG extends Win32Enum{

    /**
     * Do not flush the command buffer. This can potentially cause an infinite loop if GetData is continually called until it returns S_OK as there may still be commands in the command buffer that need to be processed in order for GetData to return S_OK. Since the commands in the command buffer are not flushed they will not be processed and therefore GetData will never return S_OK.
     * @type {Integer (Int32)}
     */
    static D3D11_ASYNC_GETDATA_DONOTFLUSH => 1
}
