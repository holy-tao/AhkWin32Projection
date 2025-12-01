#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies categories of debug messages.
 * @remarks
 * This is part of the Information Queue feature, refer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MESSAGE_CATEGORY extends Win32Enum{

    /**
     * Indicates a user defined message, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addmessage">ID3D12InfoQueue::AddMessage</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_APPLICATION_DEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_MISCELLANEOUS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_INITIALIZATION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_CLEANUP => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_COMPILATION => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_STATE_CREATION => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_STATE_SETTING => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_STATE_GETTING => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_RESOURCE_MANIPULATION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_EXECUTION => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_MESSAGE_CATEGORY_SHADER => 10
}
