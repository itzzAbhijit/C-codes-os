// 8. SJF Scheduling

#include <stdio.h>

#define MAX_PROCESSES 5

void SJF(int bt[], int n)
{
    int wt[MAX_PROCESSES], tat[MAX_PROCESSES];

    for (int i = 0; i < n - 1; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (bt[i] > bt[j])
            {
                int temp = bt[i];
                bt[i] = bt[j];
                bt[j] = temp;
            }
        }
    }

    wt[0] = 0;

    for (int i = 1; i < n; i++)
        wt[i] = wt[i - 1] + bt[i - 1];

    for (int i = 0; i < n; i++)
        tat[i] = wt[i] + bt[i];

    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");

    for (int i = 0; i < n; i++)
        printf("%d\t%d\t\t%d\t\t%d\n", i + 1, bt[i], wt[i], tat[i]);
}

int main()
{
    int bt[MAX_PROCESSES] = {6, 8, 7, 3, 4};
    int n = 5;

    SJF(bt, n);

    return 0;
}
