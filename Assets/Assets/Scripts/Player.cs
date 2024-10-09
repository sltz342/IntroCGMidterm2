using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    private Vector3 playerPos;

    private void Start()
    {
        playerPos = transform.position;
    }

    void FixedUpdate()
    {
        playerPos.x += 0.5f;
        transform.position = playerPos;
        if (playerPos.x > 31.4f)
        {
            playerPos.x = -32.02f;
            transform.position = playerPos;
        }
    }
    
    
    
}
